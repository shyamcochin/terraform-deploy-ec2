resource "aws_key_pair" "terr-key" {
  key_name   = "terrform_key"
  public_key = "${file("${var.PUB_KEY_PATH}")}"
}

resource "aws_instance" "my_ec2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.terr-key.key_name}"
# key_name = "terrform_key"
  tags = {
    Name    = "1st EC2"
    Project = "Demo"
  }

  connection {
    type     = "ssh"
    user     = "${var.USER}"
    host = "${element(aws_instance.my_ec2.*.public_ip, 0)}"
  #  host     = "${file("${var.PUB_IP_PATH}")}"
    private_key = "${file("${var.PRI_KEY_PATH}")}"
    timeout     = "1m"
    agent       = false
  }

  provisioner "local-exec" {
     command = "echo ${aws_instance.my_ec2.public_ip} > ${var.PUB_IP_PATH}"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/web.sh",
      "sh /tmp/web.sh",
    ]
  }
}

output "IP" {
  value = "${aws_instance.my_ec2.public_ip}"
}

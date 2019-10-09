variable AWS_ACCESS_KEY {}
variable AWS_SECRET_KEY {}

variable "AWS_REGION" {
  default = "us-east-2"                 # Ohio
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-07d0cf3af28718ef8" # Ubuntu Server 18.04 LTS  - Virgiina
    us-east-2 = "ami-0f93b5fd8f220e428" # Amazon Linux 2 AMI (HVM)  - Ohio
  }
}

variable "PUB_KEY_PATH" {
  default = "terrform_key.pub"
}

variable "PRI_KEY_PATH" {
  default = "terrform_key"
}

variable "USER" {
  default = "ubuntu"
}

variable "PUB_IP_PATH" {
  description = "Path to the file that contains the instance's public IP address"
  default     = "ip_address.txt"
}

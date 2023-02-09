variable "types" {
  default = ["t3.micro", "t3.small"]
}

variable "components" {
  default = ["catalogue", "cart"]
}

resource "aws_instance" "web" {
  count         = length(var.components)
  ami           = data.aws_ami.centos8.id
  instance_type = var.types[count.index]

  tags = {
    Name = var.components[count.index]
  }
}

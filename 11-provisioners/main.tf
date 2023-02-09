provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name        = "test-centos8"
  }

  /*

 // Best Practice is to create provisioner outside resource
 // Instance will be destroyed and recreated because of false command in provisioner
 //to avoid instance recreation create provisioner with null_resource
  provisioner "remote-exec" {
    connection {
      host     = self.public_ip
      user     = "centos"
      password = "DevOps321"
    }

  // Provide commands to execute
    inline = [
      "false"
    ]
  }

  */

}

//Only provisioner will be recreated NOT the instance
resource "null_resource" "provision" {

  //If ec2 instance is terminated then only ec2 instance is created  but the provisioner will not run
  // To run the provisioner triggers will be used
  // below will trigger the provisioner when new new instance is created
  triggers = {
    instance_id = aws_instance.web.id
  }

  provisioner "remote-exec" {
    connection {
      host     = aws_instance.web.public_ip
      user     = "centos"
      password = "DevOps321"
    }

    inline = [
      //"false"
      "echo Hello Test"
    ]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
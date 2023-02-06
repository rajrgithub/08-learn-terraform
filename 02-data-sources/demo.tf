data "aws_ami" "example" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.example
}


output "instanceOutput" {
  value = data.aws_instance.foo
}

output "instance-Private_IP" {
  value = data.aws_instance.foo.private_ip
}

output "public_IP" {
  value = data.aws_instance.foo.public_ip
}

data "aws_instance" "foo"{
  instance_id = "i-0745b6189c8396f93"
}
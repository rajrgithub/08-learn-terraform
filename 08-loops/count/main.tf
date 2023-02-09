resource "aws_instance" "web" {
  count         = 1
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = "test-centos8"
  }
}


data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


output "publicip" {
  # without count
  #value = aws_instance.web.public_ip

  # with count
  value = aws_instance.web.*.public_ip

#  Error: Missing resource instance key
#│
#│   on main.tf line 21, in output "publicip":
#│   21:   value = aws_instance.web.public_ip
#│
#│ Because aws_instance.web has "count" set, its attributes must be accessed on specific instances.
#│
#│ For example, to correlate with indices of a referring resource, use:
#│     aws_instance.web[count.index]

}



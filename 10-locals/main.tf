variable "components" {
  default = {
    cart = {
      name          = "cart",
      instance_type = "t3.small"
    }
    catalogue = {
      name          = "catalogue",
      instance_type = "t3.micro"
    }
  }
}

locals {
  instance_type = { for k, v in var.components : k => v.instance_type }
  name          = { for k, v in var.components : k => v.name }
}

output "instance_type" {
  value = local.instance_type
}

output "name" {
  value = local.name
}



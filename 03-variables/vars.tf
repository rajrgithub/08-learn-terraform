variable "sample" {
  default = 10
}

output "sample" {
  value = var.sample
}

# String Data type
variable "sample1" {
  default = "Hello World"
}

# Number data type
variable "sample2" {
  default = 100
}

# Boolean Data type
variable "sample3" {
  default = true
}

# Default Variable type
variable "sample4" {
  default = 100
}

output "sample4" {
  value = var.sample4
}

# List Variable type
variable "sample5" {
  default = [
    100,
    "abc",
    "xyz"
  ]
}

output "sample5" {
  value = var.sample5[1]
}

# Map Variable type
variable "sample6" {
  default = {
    number  = 100
    string  = "xyz"
    boolean = false
  }
}

output "sample6" {
  value = var.sample6["number"]
}

## Variables from tfvars
//variable "demo1" {}
variable "demo1" {
  default=777
}
output "demo1" {
  value = var.demo1
}

## Variables from SHELL env variables
/*
variable "demo2" {
  default = null
}
*/
variable "demo2" {
  default = 999
}

output "demo2" {
  value = var.demo2
}
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
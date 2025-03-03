variable "prefix" {
  type     = string
  nullable = false

}


variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  nullable    = false
}

variable "azs" {
  type     = list(string)
  nullable = false
}
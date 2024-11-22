variable "tags" {
  type = map(string)
  default = {
    "Environment" = "production"
    "Managedby"   = "terraform"
  }
}


variable "vpc" {
  type = object({
    name = string
  })

  default = {
    name = "studying"
    cidr_block = "10.0.0.0/24"
  }
}

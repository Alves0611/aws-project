variable "tags" {
  type = map(string)
  default = {
    "Environment" = "production"
    "Managedby"   = "terraform"
  }
}


variable "vpc" {
  type = object({
    name                  = string
    cidr_block            = string
    internet_gateway_name = string
  })

  default = {
    name                  = "studying-vpc"
    cidr_block            = "10.0.0.0/24"
    internet_gateway_name = "studying-igw"
  }
}

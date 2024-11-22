variable "tags" {
  type = map(string)
  default = {
    "Environment" = "production"
    "Managedby"   = "terraform"
  }
}


variable "vpc" {
  type = object({
    name       = string
    cidr_block = string

    internet_gateway_name = string

    public_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))
  })

  default = {
    name       = "studying-vpc"
    cidr_block = "10.0.0.0/24"

    internet_gateway_name = "studying-igw"

    public_subnets = [
      {
        name                    = "public-us-east-1a"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1a"
        cidr_block              = "10.0.0.0/26"
      },
      {
        name                    = "public-us-east-1b"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1b"
        cidr_block              = "10.0.0.64/26"
      },
      {
        name                    = "public-us-east-1c"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1c"
        cidr_block              = "10.0.0.128/26"
      }

    ]
  }
}

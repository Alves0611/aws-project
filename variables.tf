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

    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    eip                      = string

    public_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))

    private_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))
  })

  default = {
    name       = "studying-vpc"
    cidr_block = "10.0.0.0/24"

    internet_gateway_name    = "studying-igw"
    nat_gateway_name         = "studying-nat"
    public_route_table_name  = "studying-public-route-table"
    private_route_table_name = "studying-private-route-table"
    eip                      = "studying-eip"

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
      }
    ]

    private_subnets = [
      {
        name                    = "private-us-east-1a"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1a"
        cidr_block              = "10.0.0.128/26"
      },
      {
        name                    = "private-us-east-1b"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1b"
        cidr_block              = "10.0.0.192/26"
      }
    ]
  }
}


variable "eks_cluster" {
  type = object({
    name                              = string
    role_name                         = string
    enabled_cluster_log_types         = list(string)
    access_config_authentication_mode = string
    node_group = object({
      name                        = string
      role_name                   = string
      instance_types              = list(string)
      scaling_config_max_size     = number
      scaling_config_min_size     = number
      scaling_config_desired_size = number
    })
  })

  default = {
    name      = "studying-eks-cluster"
    role_name = "StudyingEKSClusterRole"
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler"
    ]
    access_config_authentication_mode = "API_AND_CONFIG_MAP" # Corrigido aqui
    node_group = {
      name                        = "studying-eks-cluster-node-group"
      role_name                   = "StudyingEKSClusterNodeGroup"
      instance_types              = ["t3.medium"]
      scaling_config_max_size     = 2
      scaling_config_min_size     = 2
      scaling_config_desired_size = 2
    }
  }
}

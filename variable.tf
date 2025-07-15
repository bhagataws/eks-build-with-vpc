variable "vpc_cidr" {
  
}

variable "subnet_zone1_cidr-public-1" {
  
}

variable "subnet_zone1_cidr-public-2" {
  
}

variable "subnet_zone2_cidr-private-1"{
  
}
variable "subnet_zone2_cidr-private-2"{
  
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "kube-proxy"
      version = "v1.32.6-eksbuild.2"
    },
    {
      name    = "vpc-cni"
      version = "v1.19.6-eksbuild.7"
    },
    {
      name    = "coredns"
      version = "v1.11.4-eksbuild.14"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.45.0-eksbuild.2"
    }
  ]
}
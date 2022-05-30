variable "vpc_cidr" {
  description = "CIDR range of VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  default = "ap-south-1"
}

variable "availabilityZone" {
  default = "ap-south-1a"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}

variable "subnetCIDRblock_a" {
  default = "10.0.101.0/24"
}

variable "subnetCIDRblock_b" {
  default = "10.0.102.0/24"  
}

variable "subnetCIDRblock_c" {
  default = "10.0.103.0/24"  
}

variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
  type = list
  default = [ "0.0.0.0/0" ]
}

variable "egressCIDRblock" {
  type = list
  default = [ "0.0.0.0/0" ]
}

variable "mapPublicIP" {
  default = true
}

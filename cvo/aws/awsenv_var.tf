

variable "region" {
   type        = "string"
   default     = "us-east-1"
   description = "Region configuration used accross whole configuration."
}



variable "cvo_amis" {
    type        = "map"
    description = "List of the OnCommand Cloud Manager AMIs per region."
    default     = {
        "ap-south-1"     = "ami-c2bdc2ad"
        "eu-west-2"      = "ami-fba8bf9f"
        "eu-west-1"      = "ami-bf9986d9"
        "ap-northeast-2" = "ami-2e8d5240"
        "ap-northeast-1" = "ami-8e979ee9"
        "sa-east-1"      = "ami-982843f4"
        "ca-central-1"   = "ami-38e9565c"
        "ap-southeast-1" = "ami-b89c1edb"
        "ap-southeast-2" = "ami-cb3322a8"
        "eu-central-1"   = "ami-975bfff8"
        "us-east-1"      = "ami-0442003f55a1ed089" # ONTAP cloud volume
        "us-east-2"      = "ami-98a98ffd"
        "us-west-1"      = "ami-379ebc57"
        "us-west-2"      = "ami-0258537b"
    }
}


variable "occm_amis" {
    type        = "map"
    description = "List of the OnCommand Cloud Manager AMIs per region."
    default     = {
        "ap-south-1"     = "ami-c2bdc2ad"
        "eu-west-2"      = "ami-fba8bf9f"
        "eu-west-1"      = "ami-bf9986d9"
        "ap-northeast-2" = "ami-2e8d5240"
        "ap-northeast-1" = "ami-8e979ee9"
        "sa-east-1"      = "ami-982843f4"
        "ca-central-1"   = "ami-38e9565c"
        "ap-southeast-1" = "ami-b89c1edb"
        "ap-southeast-2" = "ami-cb3322a8"
        "eu-central-1"   = "ami-975bfff8"
        "us-east-1"      = "ami-0ff1d3d1d2b0be33a" # Oncommand cloud manager
        "us-east-2"      = "ami-98a98ffd"
        "us-west-1"      = "ami-379ebc57"
        "us-west-2"      = "ami-0258537b"
    }
}


variable "key_name" {
    type        = "string"
    default     = "awscvo"
    description = "security Key file to connect for the OCCM instance."
}

variable "admin" {
    type        = "string"
#    default     = "cloudnasadmin"
    default     = "glnasadm"
    description = "Admin for the OCCM instance."
}


variable "private_key_location" {
    type        = "string"
    default     = "/home/pi/.ssh/id_rsa.pem"
    description = "Provide the location of security key for the provisioner to execute on clould ONTAP managment instance."
}

variable "tcp" {
    type        = "string"
    default     = "tcp"
    description = "Protocol type - TCP."
}

variable "udp" {
    type        = "string"
    default     = "udp"
    description = "Protocol type - UDP."
}

variable "cidr" {
    type        = "string"
    default     = "172.33.0.0/16"
    description = "CIDR block for VPC and inbound security definitions."
}

variable "cidr_blocks" {
    type        = "list"
    default     = ["172.33.0.0/16"]
    description = "CIDR block for VPC and inbound security definitions."
}

variable "r1_subnet_cidr" {
    type        = "string"
    default     = "172.33.1.0/24"
    description = "CIDR block for VPC and inbound security definitions."
}

variable "r2_subnet_cidr" {
    type        = "string"
    default     = "172.33.2.0/24"
    description = "CIDR block for VPC and inbound security definitions."
}

variable "ec2_subnet_cidr" {
    type        = "string"
    default     = "172.33.3.0/24"
    description = "CIDR block for VPC and inbound security definitions."
}

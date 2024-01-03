variable "region" {
    type = string
    default = "us-east-1"
    description="aws region"
}

variable "amis" {
    type=map
    default = {
        us-east-1 = "ami-079db87dc4c10ac91"
    }
    description = "ami id"

}

variable "instance_type" {
    type=string
    default = "t2.micro"
    description = "EC2 instance type"
}



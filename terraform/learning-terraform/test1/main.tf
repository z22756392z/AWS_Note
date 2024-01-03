provider "aws" {
  region = var.region
}

resource "aws_vpc" "testvpc1"{
    cidr_block="192.168.0.0/16"
    tags = {
        Name = "testvpc1"
    }
}

resource "aws_subnet" "testvpc-web" {
    vpc_id = "${aws_vpc.testvpc1.id}"
    cidr_block = "192.168.1.0/24"
    tags = {
        Name = "testvpc-web"
    }
}
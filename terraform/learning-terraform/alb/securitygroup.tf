resource "aws_security_group" "sg_http" {
	name = "sg_http"
	description = "Allow incoming Http Conncections"
	vpc_id="${aws_vpc.vpc.id}"
  
	ingress {
       description = "HTTPS traffic"
       from_port = 443
       to_port = 443
       protocol ="tcp"
       cidr_blocks = ["0.0.0.0/0"]   
    }

    ingress {
       description = "HTTP traffic"
       from_port = 80
       to_port = 80
       protocol ="tcp"
       cidr_blocks = ["0.0.0.0/0"]   
    }

    ingress {
       description = "SSH traffic"
       from_port = 22
       to_port = 22
       protocol ="tcp"
       cidr_blocks = ["0.0.0.0/0"]   
    }

    egress {
        from_port = 0
        to_port = 0
        protocol ="-1"
        cidr_blocks= ["0.0.0.0/0"]  
    }

    tags = {
        Name = "sg"
    }
}

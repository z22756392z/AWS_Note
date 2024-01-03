
resource "aws_instance" "ec2_web" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  count = length(var.availability_zones)
  associate_public_ip_address = "true"
  subnet_id = aws_subnet.subnets[count.index].id
  security_groups = ["${aws_security_group.sg_http.id}"]
  user_data = <<-EOF
     #!/bin/bash
     sudo su
     yum update -y
     yum install httpd -y
     systemctl start httpd
     systemctl enable httpd
     echo "<h1>web${count.index}</h1>" > /var/www/html/index.html
  EOF
  tags = {
    name ="ec2_web${count.index}"
  }
}

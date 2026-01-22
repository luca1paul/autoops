# infra/terraform/main.tf

# resource "aws_vpc" "main" {
# cidr_block           = var.vpc_cidr
#  enable_dns_support   = true
#  enable_dns_hostnames = true
#  tags = {
#    Name = "${var.project_name}-vpc"
#  }
#}

#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.main.id
#  tags = {
#    Name = "${var.project_name}-igw"
#  }
#}

#resource "aws_subnet" "public_subnet" {
#  vpc_id                  = aws_vpc.main.id
#  cidr_block              = "10.0.1.0/24"
#  map_public_ip_on_launch = true
#  availability_zone       = "us-east-1a"
#  tags = {
#    Name = "${var.project_name}-public"
#  }
#}

#resource "aws_route_table" "public_rt" {
#  vpc_id = aws_vpc.main.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#  tags = {
#    Name = "${var.project_name}-public-rt"
#  }
#}

#resource "aws_route_table_association" "public_assoc" {
#  subnet_id      = aws_subnet.public_subnet.id
#  route_table_id = aws_route_table.public_rt.id
#}

#resource "aws_security_group" "allow_ssh_http" {
#  name        = "${var.project_name}-sg"
#  description = "Allow SSH and HTTP traffic"
#  vpc_id      = aws_vpc.main.id

#  ingress {
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
# }

#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  tags = {
#    Name = "${var.project_name}-sg"
#  }
#}

#resource "aws_instance" "autoops_server" {
#  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (check for region)
#  instance_type          = "t2.micro"
#  subnet_id              = aws_subnet.public_subnet.id
#  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
#  key_name               = "autoops-key" # Replace with your AWS key pair name

#  tags = {
#    Name = "${var.project_name}-server"
#  }
#}

resource "null_resource" "mock_vpc" {
  provisioner "local-exec" {
    command = "echo 'Simulating VPC creation locally...'"
  }
}

resource "null_resource" "mock_instance" {
  provisioner "local-exec" {
    command = "echo 'Simulating EC2 instance setup locally...'"
  }
}

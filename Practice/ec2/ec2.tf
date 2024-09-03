resource "aws_instance" "docker" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-0fbd7c454bc70bbba"]
    instance_type = "t3.micro"

user_data = <<EOF
#!/bin/bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker
systemctl enable docker
sudo usermod -aG  docker ec2-user

EOF

 tags = {
    Name = "docker"
  }
}

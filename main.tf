terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.32"
    }
   /* docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.2"
    } */
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-1"
}

resource "aws_instance" "Final" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  security_groups= ["launch-wizard-1","default"]
  key_name= "brend"

  tags = {
    Name = "Final02"
  }
}
output "instance_public_ip" {
  description = "Obtener la IP publica de mi instancia"
  value = aws_instance.Final.public_ip  //aws_instance.$NOMBRE-RECURSO-TIPO-aws_instance$.public_ip
}

/* variable "reponame" {}
variable "container_port" {}

provider "docker" {
   host = "unix:///var/run/docker.sock"
}


resource "docker_container" "Final02" {
  image = docker_image.Final.latest
  name  = var.reponame
  ports {
    internal = 80
    external = var.container_port
  }
}
*/

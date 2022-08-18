terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 4.16"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "proyecto" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "proyecto01"
  }
}


provider "docker"{
  host="unix:///var/run/docker.sock"
}

resource "docker_image" "juan" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "index"{
  name= "index"
  image = "josuercb/proyecto02"
  
  ports{
    internal=80
    external=84
  }
}


  

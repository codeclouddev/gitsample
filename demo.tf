# Specify the provider and its source
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"  # Correct source for Docker provider
      version = "~> 2.0"  # Specify the provider version (optional)
    }
  }
}

# Docker provider configuration
provider "docker" {
  host = "tcp://localhost:2375"
}


# Docker image resource for NGINX
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Docker container resource
resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx_image.name
  ports {
    internal = 80   # Port inside the container
    external = 8081 # Port on your local machine
  }
}

provider "digitalocean" {
  token = var.do_token
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_droplet" "web" {
  image     = "ubuntu-20-04-x64"
  name      = "web-1"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  ssh_keys  = [var.ssh_do_key]

  lifecycle {
    create_before_destroy = true
  }
}

output "ip_droplet" {
  value = digitalocean_droplet.web.ipv4_address
}

variable "do_token" {
  description = "Token de acesso da DigitalOcean"
  type        = string
}

variable "ssh_do_key" {
  description = "Chave SSH vinculada"
  type        = string
}

provider "digitalocean" {
  token = var.do_token
}

terraform{
    required_providers{
        digitalocean ={
            source = "digitalocean/digitalocean"
        }
    }
  }

  resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "web-1"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

variable "do_token" {
  description = "Token de acesso da DigitalOcean"
  type        = string
}
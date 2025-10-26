variable "proxmox_host" {
  description = "Proxmox node to deploy containers on"
  type        = string
  default     = "proxhost"
}

variable "container_count" {
  description = "Number of LXC containers to create"
  type        = number
  default     = 3
}

variable "base_template" {
  description = "Base LXC OS template to use"
  type        = string
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "ansible_password" {
  description = "Password for the ansible user"
  type        = string   
}

variable "container_password" {
  description = "Container root password"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to your SSH public key"
  type        = string
}

variable "proxmox_API_Token" {
  description = "Proxmox API Token for authentication"
  type        = string
  sensitive   = true
}

variable "proxmox_API_Token_ID" {
  description = "Proxmox API Token for authentication"
  type        = string
  sensitive   = true
}

variable "proxmox_host_address"{
description = "Proxmox host address"
type        = string
sensitive   = true

}
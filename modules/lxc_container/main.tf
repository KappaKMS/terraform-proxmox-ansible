terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}

provider "proxmox" {
 pm_api_url   = var.proxmox_host_address
 pm_api_token_id      = var.proxmox_API_Token_ID
 pm_api_token_secret  = var.proxmox_API_Token
 pm_tls_insecure = true
}

data "local_file" "sshkey" {
  filename = var.ssh_public_key
}

resource "proxmox_lxc" "ubuntu_containers" {
  count        = var.container_count
  target_node  = var.proxmox_host
  ostemplate   = var.base_template
  unprivileged = true
  password     = var.container_password
  ssh_public_keys = data.local_file.sshkey.content
  memory   = var.memory
  cores    = var.cpu
  rootfs   = var.disk
  
  features {
    nesting = true
  }

  startup = "order=1"

  start = true

}


resource "null_resource" "install_ssh" {
  count      = var.container_count
  depends_on = [proxmox_lxc.ubuntu_containers]

  provisioner "remote-exec" {
    inline = [

      "apt update -y && apt install -y openssh-server && systemctl enable ssh && systemctl start ssh",
      "useradd -m -s /bin/bash ansible",
      "echo 'ansible:${var.ansible_password}' | chpasswd",
      "usermod -aG sudo ansible",

      # Create .ssh directory for ansible user
      "mkdir -p /home/ansible/.ssh && chmod 700 /home/ansible/.ssh && chown ansible:ansible /home/ansible/.ssh",

      # Copy local SSH public key into the container's authorized_keys
      "echo '${data.local_file.sshkey.content}' >> /home/ansible/.ssh/authorized_keys",
      "chmod 600 /home/ansible/.ssh/authorized_keys && chown ansible:ansible /home/ansible/.ssh/authorized_keys",

      # Restart SSH
      "systemctl enable ssh",
      "systemctl restart ssh",
    ]
    
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_ed25519")
      host     = "192.168.0.${count.index + 200}"  # example static IPs
    }
  }
}




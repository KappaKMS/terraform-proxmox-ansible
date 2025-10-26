module "lxc_client1" {
  source     = "/home/kappa/repositories/terraform-proxmox-ansible/modules/lxc_container"
  container_count = 3
  hostname     = "testclient-${count.index + 1}"
  memory     = 1024
  cpu        = 1
  disk       = "10G"
  ssh_pubkey = file("~/.ssh/id_ed25519.pub")
}

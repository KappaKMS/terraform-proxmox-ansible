🧠 This project focuses on diving deep into virtualization, automation, and infrastructure-as-code — building everything from the ground up inside my Proxmox lab. Of course, I've used AI and all the available documentation that I could get my hands on. I am very excited about my progress so far!

🖥️ Proxmox Virtual Environment

Installed Proxmox VE on a single NVMe drive and learned how its installer manages LVM storage for ISOs, VM disks, and backups.
Created multiple Alpine 3.22 LXC containers from a base template, practiced Alpine-specific management with apk and rc-service, and configured SSH access and sudo privileges for automation.
Converted an Alpine LXC into a reusable Proxmox template for quick redeployment of pre-configured environments.

<img width="800" height="276" alt="image" src="https://github.com/user-attachments/assets/981f3579-ff00-43e5-b369-084c96b031f7" />


☁️ Terraform Integration

Installed Terraform on the Ubuntu control node to automate Proxmox deployments.
Used Terraform to provision three identical Ubuntu LXC containers, each preconfigured with an ansible user (added to the sudoers group).
Passed the control node’s SSH public key automatically to ensure passwordless access from the start.

<img width="800" height="480" alt="image" src="https://github.com/user-attachments/assets/47623c26-a57b-4d03-a589-1b58c357a154" />


⚙️ Ansible Automation

Configured an Ubuntu 22.04 control node with Ansible and private/public key SSH to all containers.
Wrote playbooks to update packages, install essential tools (vim, curl, lsof), and validate running services across all clients.

<img width="800" height="499" alt="image" src="https://github.com/user-attachments/assets/1b794645-0cab-4aa0-89bc-1f9141bc1f04" />


🧠 Version Control with GitHub

Created a dedicated GitHub repository for managing my Ansible and Terraform configurations.
Practiced Git fundamentals — adding files, committing changes, branching, and pushing to both master and dev.
This extended lab tied together virtualization, configuration management, and infrastructure as code — giving me a deeper understanding of how modern DevOps workflows connect from bare metal to automation and version control.

I’m genuinely passionate about understanding how things work under the hood — from virtualization and automation to linux, version control, and orchestration. I enjoy experimenting, breaking things, fixing them, and learning something new every time. With that said, I am really looking forward to exploring this using terraform and ansible in the cloud! 🚀

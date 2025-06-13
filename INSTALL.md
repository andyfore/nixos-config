# 1. Set up networking (if not already connected)
nmcli device wifi list
nmcli device wifi connect <SSID> password <PASSWORD>

---

# 2. Clone your GitHub repo into the live ISO user's home
git clone https://github.com/your-username/nixos-config.git ~/nixos-config

> **Note on SSH Cloning:**
> If you prefer to use SSH for cloning (which requires adding the installer's SSH key to GitHub), follow these steps:
> ```bash
> ssh-keygen -t ed25519 -C "nixos-install"
> cat ~/.ssh/id_ed25519.pub # Add this key to GitHub temporarily
> git clone git@github.com:your-username/nixos-config.git ~/nixos-config
> ```
> Otherwise, HTTPS cloning (as shown above) is generally recommended for initial setup.

---

# 3. Partition and format the disk using Disko
nix run github:nix-community/disko -- --mode zap_create_mount ~/nixos-config/hosts/asus-amd-laptop/disko.nix

---

# 4. Install NixOS from the flake
nixos-install --flake ~/nixos-config#asus-amd-laptop

---

# 5. Reboot
reboot

---

✅ After reboot:
- You’ll be prompted for the LUKS password (unless TPM2 auto-unlock is enrolled)
- SSH access is enabled for user `andyfore`

---

👉 Optional:
- Use `systemd-cryptenroll --tpm2 /dev/nvme0n1p2` to set up TPM unlocking
- Use `filefrag -v /swapfile` to get the resume offset for hibernation setup

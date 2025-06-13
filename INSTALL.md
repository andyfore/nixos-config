# 1. Set up networking (if not already connected)
nmcli device wifi list
nmcli device wifi connect <SSID> password <PASSWORD>

# 2. Partition and format the disk using Disko
nix run github:nix-community/disko -- --mode zap_create_mount ./hosts/asus-amd-laptop/disko.nix

# 3. Mount all partitions (if needed)
mount | grep /mnt

# 4. Clone your GitHub repo
git clone git@github.com:your-username/nixos-config.git /mnt/etc/nixos
cd /mnt/etc/nixos

# 5. Install NixOS from the flake
nixos-install --flake .#asus-amd-laptop

# 6. Reboot
reboot
```

✅ After reboot:
- You’ll be prompted for the LUKS password (unless TPM2 auto-unlock is enrolled)
- SSH access is enabled for user `andyfore`

👉 Optional:
- Use `systemd-cryptenroll --tpm2 /dev/nvme0n1p2` to set up TPM unlocking
- Use `filefrag -v /swapfile` to get the resume offset for hibernation setup

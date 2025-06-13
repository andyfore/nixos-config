# nixos-config

This repository defines a modular and reproducible NixOS configuration using flakes. It supports:

- 💻 `asus-amd-laptop` (hostname: `terminus`) – Hyprland + FDE + TPM + SDDM
- 🖥️  `homelab-server` (hostname: `singlepane`) – Headless Intel server

## 📦 Setup
```bash
# Format the disk
sudo nix run github:nix-community/disko -- --mode zap_create_mount ./hosts/asus-amd-laptop/disko.nix

# Install system with flake
nixos-install --flake github:your-username/nixos-config#asus-amd-laptop
```

## ✅ Notes
- TPM unlocking requires systemd-based initrd and compatible firmware
- Enable Snapper or btrbk for `/.snapshots` usage
- Remote SSH and GitHub SSH access enabled for user `andyfore`

### 📦 What This Disko Layout Provides

- 📁 **EFI Partition** on `/boot`
- 🔐 **LUKS2 Encryption** on the partition labeled `luks`
- 🧠 **TPM2 Unlocking** via `fde-tpm.nix` module
- 🗂️ **Btrfs Subvolumes**:
  - `@root` → `/`
  - `@home` → `/home`
  - `@nix` → `/nix`
  - `@snapshots` → `/.snapshots` (for use with `snapper` or `btrbk`)
  - `@swap` → `/.swapvol` with a 16G swapfile
- 📦 **Btrfs Options**: `compress=zstd:3` and `noatime` for performance

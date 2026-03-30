{ ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      UseDns = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.gnome3.gnome-keyring.enable = true;
  services.udisks2.enable = true;
}

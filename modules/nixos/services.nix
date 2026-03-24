{ ... }
{
  services.openssh = {
    enable = true;
    settings = {
      UseDns = false;
      PasswordAuthentication = false;
      PermitRootLogin = no;
    };
  };
}

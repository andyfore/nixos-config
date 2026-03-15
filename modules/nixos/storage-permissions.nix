{
  systemd.tmpfiles.rules = [
    "d /data 0755 andyfore users -"
    "d /data/code 0755 andyfore users -"
    "d /data/games 0755 andyfore users -"
  ];
}

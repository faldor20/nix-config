{config,pkg,...}:
{
  programs.fish=
  {
    enable=true;
    shellAliases=   {
      "nixcon"="sudo nvim /etc/nixos/configuration.nix";
      "nixre"="sudo nixos-rebuild switch";
      };
  };
}

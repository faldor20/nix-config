{config,pkg,...}:
{
  programs.fish=
  {
    enable=true;
    shellAliases=   {
      "nixcon"="sudo nvim /etc/nixos/configuration.nix";
      "nixre"="sudo nixos-rebuild switch";
      "nixProg"= "sudo nvim /etc/nixos/programs.nix";
    };
 #  functions={  
 #    nixUp={
 #      body=" cd /etc/nixos
 #      sudo git stage *\
 #        sudo git commit -a -m changes\
 #        sudo git push ";
 #    };
 #  };
  };
}
 

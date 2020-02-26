{pkgs,config,...}:
{





    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      wget vim
      udevil
      git
      rofi
      dmenu
	    htop
	    which
	    kitty
	    fira-code
	    compton
	    samba
      home-manager
	    nodejs
	    firefox
	    ranger
	    emacs
	    neovim
	    i3-gaps
	    polybar
	    feh
	    nitrogen
	    fish
	    mpd
	    ncmpcpp
      vscode
      mpv
      fsharp
      polkit
      nixfmt
    ];
	  boot.extraModulePackages = [config.boot.kernelPackages.exfat-nofuse];


    nixpkgs.config=pkgs: rec
    {  
    security.polkit.enable =true;   
    #enable proprietory drivers
    allowUnfree = true;                                      
    packageOverrides = super: let self = super.pkgs; in { 
    ncmpcpp = super.ncmpcpp.override { visualizerSupport = true; clockSupport = true; };
    dotnetv3=super.dotnet-sdk.overrideAttrs  (oldAttrs: rec  {
      version = "3.1.100";
      netCoreVersion = "3.1.100";
      pname = "dotnet-sdk";

      src = super.fetchurl {        url = "https://dotnetcli.azureedge.net/dotnet/Sdk/3.1.100/dotnet-sdk-3.1.100-linux-x64.tar.gz";
      # use sha512 from the download page        sha512 = "5217ae1441089a71103694be8dd5bb3437680f00e263ad28317665d819a92338a27466e7d7a2b1f6b74367dd314128db345fa8fff6e90d0c966dea7a9a43bd21";
      };
    });
    };

    };

}

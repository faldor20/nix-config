{pkgs,config,nixpkgs,...}:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in{

  #dotnetCombined = with dotnetCorePackages; combinePackages [ sdk_3_1 sdk_2_2  ];



  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
font-awesome
discord
    shutter
    wget vim
    udevil
    mono
    unzip
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
    taskwarrior 
    i3-gaps
    sxhkd
    polybar
    jsoncpp
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
    zathura
pavucontrol
awesome 
    msmtp
    cargo
    rustup
libnl
unstable.dotnet-sdk
  ];
  boot.extraModulePackages = [config.boot.kernelPackages.exfat-nofuse];

services.tlp.enable = true;
  nixpkgs.config=pkgs: rec
  { 


    security.polkit.enable =true;   
  #enable proprietory drivers
  allowUnfree = true;                                      
  packageOverrides = super: let self = super.pkgs; in { 
    ncmpcpp = super.ncmpcpp.override { visualizerSupport = true; clockSupport = true; };
    dotnetv3=super.dotnet-sdk.overrideAttrs  (oldAttrs: rec  {
      version = "3.1.102";
      netCoreVersion = "3.1.102";
      pname = "dotnet-sdk";

      src = super.fetchurl {        url = "https://dotnetcli.azureedge.net/dotnet/Sdk/3.1.102/dotnet-sdk-3.1.102-linux-x64.tar.gz";
    #   use sha512 from the download page
    sha512 = "9cacdc9700468a915e6fa51a3e5539b3519dd35b13e7f9d6c4dd0077e298baac0e50ad1880181df6781ef1dc64a232e9f78ad8e4494022987d12812c4ca15f29";
  };
});
  };

};

}

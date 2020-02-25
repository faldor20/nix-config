# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
#let
 # home-manager = builtins.fetchGit {
  #  url = "https://github.com/rycee/home-manager.git";
   # ref = "release-19.09";
 # };

#in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix    
 #     (import "${home-manager}/nixos")

];
	
#home-manager.users.eli = { pkgs, ... }: {
#imports=
#[
#	./programs.nix
#]; 
#};	


    services.mpd=
    {
        enable= true;
        musicDirectory="/mnt/media/music";
       # dataDir="~/.mpd/";
       # user="eli";
      # group=""
    };
    
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber=true;
   networking.hostName = "nixos"; # Define your hostname.
 #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s20u1.useDHCP = false;
  networking.interfaces.enp7s0.useDHCP = true;
  networking.interfaces.wlp8s0.useDHCP = true;
networking.networkmanager.enable=true;

 boot.supportedFilesystems = [ "ntfs" ];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
time.timeZone = "Australia/Brisbane";
    time.hardwareClockInLocalTime=true;
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
   ];
	boot.extraModulePackages = [config.boot.kernelPackages.exfat-nofuse];


nixpkgs.config=pkgs: rec
{  
   
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
   
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
   services.xserver={enable = true;
  layout = "us";
  xkbOptions = "eurosign:e";
autorun=true;
  # Enable touchpad support.
  libinput.enable = true;

  # Enable the KDE Desktop Environment.
  displayManager.sddm.enable = true;
windowManager.i3.enable=true;
windowManager.i3.package= pkgs.i3-gaps;

  #desktopManager.plasma5.enable = true;

};

services={
compton.enable =true;
compton.shadow =true;
#compton.inactiveOpactiy ="0.8";
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.eli = {
     isNormalUser = true;
	createHome=true;
	shell=pkgs.fish;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}


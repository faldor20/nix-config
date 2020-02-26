# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let home-manager = builtins.fetchGit {              
url = "https://github.com/rycee/home-manager.git";                                            
ref = "release-19.09";  
};
in{

  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix    
    (import "${home-manager}/nixos") 
    ./laptop.nix
    ./programs.nix
    ];
    home-manager.users.eli = { pkgs, ... }: {         
    imports=    [
      ./homeFiles.nix
    ];
    };






    services.mpd=
      {
        enable= true;
        # dataDir="~/.mpd/";
        # user="eli";
        # group=""
      };
      # Use the systemd-boot EFI boot loader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.grub.useOSProber=true;


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
      programs.fish.enable=true;
      users.extraUsers.eli={
        shell=pkgs.fish;
      };
      users.users.eli = {
        isNormalUser = true;
	      createHome=true;
        #	shell=pkgs.fish;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      };

      # This value determines the NixOS release with which your system is to be
      # compatible, in order to avoid breaking some software such as database
      # servers. You should change this only after NixOS release notes say you
      # should.
      system.stateVersion = "19.09"; # Did you read the comment?

}


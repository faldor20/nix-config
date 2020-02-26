{config,pkgs,...}:
{
  fileSystems."/storage"={
    device="/dev/sdc5";
    mountPoint="/mnt/storage";
  };
  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.mpd.musicDirectory="/mnt/storage/Media";
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  #networking.interfaces.enp0s20u1.useDHCP = false;
  networking.interfaces.enp7s0.useDHCP = true;
  networking.interfaces.wlp8s0.useDHCP = true;
  networking.networkmanager.enable=true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


}

# configuration for software using ni
{pkgs,...}:
 {
   imports= [
     ./programs/email.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
  #  (import "${home-manager}/nixos")
    ./programs/musicPlayer.nix
    ./programs/fish.nix
    ./programs/i3.nix
    ./programs/sxhkd.nix
    ./programs/polybar.nix
    ./programs/mpd.nix
 #   ./configuration.nix
  ];

}

# configuration for software using ni
{pkgs,...}:
 {
  imports= [
    ./programs/neovim.nix
    ./programs/kitty.nix
  #  (import "${home-manager}/nixos")
    ./programs/musicPlayer.nix
    ./programs/fish.nix
    ./programs/i3.nix
 #   ./configuration.nix
  ];

}

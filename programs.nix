# Configuration for software using ni
{pkgs,...}:
{
imports= [
  ./programs/neovim.nix
  ./programs/kitty.nix
  ./programs/musicPlayer.nix
  ./programs/fish.nix
  ./programs/i3.nix
];
}

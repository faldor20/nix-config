{pkgs,config,...}:{
  fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts
  
  #polybar
  dina-font
  siji
  unifont

  proggyfonts
];
  }

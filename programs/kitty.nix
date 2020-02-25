{pkg,... }:
{
home.file.".config/kitty/kitty.conf".text="
font_family fira-code
shell=fish;
editor=nvim
Color scheme {{{

background_opacity 0.5

background            #2f2f2f
foreground            #afc2c2
cursor                #ffffff
selection_background  #7cbeff
color0                #000000
color8                #000000
color1                #ff2f2f
color9                #ff2f2f
color2                #549a6f
color10               #549a6f
color3                #ccac00
color11               #ccac00
color4                #0099cc
color12               #0099cc
color5                #cc68c8
color13               #cc68c8
color6                #79c4cc
color14               #79c4cc
color7                #bccccc
color15               #bccccc
selection_foreground #2f2f2f
}}}
";
}
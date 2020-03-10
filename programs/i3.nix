{pkgs,config,lib,...}:

let mod="Mod4";
 
in{
 xsession.windowManager.i3 = {

    extraConfig=
    "exec --no-startup-id feh --bg-scale '/home/eli/Downloads/john-kearney-cityscape-poster-artstation-update.jpg'";
enable=true;
#config=import"/etc/nixos/programs/i3.conf";
   config={
   
  modifier = "${mod}";
    keybindings=lib.mkOptionDefault{
     "${mod}+Return"= "exec kitty";
     "${mod}+d"="exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans 8'";
   };

   gaps={
     inner=10;
     outer=5;
     smartBorders="on";
   };
 };
};
}

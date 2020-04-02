{config,pkgs,...}:

{
  services.sxhkd={
    enable=true;
    keybindings={

"XF86Audio{LowerVolume,RaiseVolume}"=
   " amixer sset master 3{-,+}";
    "XF86MonBrightnessUp"="light -A 10";
    "XF86MonBrightnessDown"="light -U 10";
    "ctrl+F5"="light -U 10";
    "ctrl+F4"="light -A 10";
  };
  };
  }

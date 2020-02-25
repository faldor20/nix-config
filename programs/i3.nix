{pkgs,config,lib,...}:

let mod="Mod4";
in{
 xsession.windowManager.i3 = {
  enable=true;
    config={
    
   modifier = "${mod}";
      keybindings=lib.mkOptionDefault{
      "${mod}+Return"= "exec kitty";
    };
    
    gaps={
      inner=10;
      outer=10;
      smartBorders="on";
    };
  };
};
}

{ pkgs, ... }:
{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email = {
    accounts.hinterlandIT = {
      address = "eli@hinterlandit.net";
      gpg = {
        key = "F9119EC8FCC56192B5CF53A0BF4F64254BD8C8B5";
        signByDefault = true;
      };
      imap.host = "mail.privateemail.com ";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Eli Dowling";
      signature = {
        text = ''
          Cheers
          - ELi
        '';
        showSignature = "append";
      };
      passwordCommand = "mail-password";
      smtp = {
        host = "mail.privateemail.com ";
      };
      userName = "eli@hinterlandit.net";
    };
  };
}

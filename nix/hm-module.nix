self: {
  pkgs,
  config,
  lib,
  ...
}: {
  options.programs.hyprcursor-phinger.enable = lib.mkEnableOption "hyprcursor-phinger";
  config = lib.mkIf config.programs.hyprcursor-phinger.enable {
    home.file = {
      "phinger-cursors-light" = {
        source = "${self.packages.${pkgs.system}.hyprcursor-phinger}/cursors/theme_phinger-cursors-light";
        target = ".local/share/icons/phinger-cursors-light";
      };
      "phinger-cursors-dark" = {
        source = "${self.packages.${pkgs.system}.hyprcursor-phinger}/cursors/theme_phinger-cursors-dark";
        target = ".local/share/icons/phinger-cursors-dark";
      };
    };
  };
}

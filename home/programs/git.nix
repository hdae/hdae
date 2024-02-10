{ pkgs, ... }: {

  # 
  programs = {

    # Git
    git = {
      enable = true;

      # Generate config
      extraConfig = {
        user = {
          name = "Hedudae";
          email = "98353469+hdae@users.noreply.github.com";
        };
        ghq = {
          "root" = "~/repo";
        };
      };
    };

    # GitHub CLI
    gh = {
      enable = true;
    };
  };

  # Ghq
  home.packages = with pkgs; [ ghq ];
}

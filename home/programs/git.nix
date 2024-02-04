{
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

    # Configure GitHub CLI
    gh = {
      enable = true;
    };
  };
}

{ pkgs, ... }: {
  home = {
    sessionVariables = { DO_NOT_TRACK = 1; };
    packages = with pkgs; [ devbox ];
  };
}

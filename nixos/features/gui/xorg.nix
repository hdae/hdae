{

  # Configure keymap in X11
  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # Enable the Budgie Desktop environment.
    displayManager.lightdm.enable = true;
    desktopManager.budgie.enable = true;

    # Keyboard Layout
    layout = "us";
    xkbVariant = "";

    # Mouse and Touchpad
    libinput.mouse = {

      # Disable touchpad when typing.
      disableWhileTyping = true;
    };
  };
}

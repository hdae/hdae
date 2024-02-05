{ lib, ... }:

{

  # Set your time zone.
  time.timeZone = lib.mkDefault "Asia/Tokyo";

  # Locale
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
}

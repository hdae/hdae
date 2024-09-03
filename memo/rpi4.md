# Install to Raspberry Pi 4

## Get image from hydra

Get aarch64 generic image from [Hydra](https://hydra.nixos.org/job/nixos/trunk-combined/nixos.sd_image.aarch64-linux), and write to SD card.

## Start nix shell

```
nix-shell -p git neovim gptfdisk
```

## Write to SD card

- host is hostname, i.e. rpi01

```
sudo mount /dev/sda2 /mnt
sudo mount /dev/sda1 /mnt/boot
sudo nixos-generate-config --root /mnt --dir .
cat hardware-configuration.nix > ./nixos/[host]/hardware.nix
sudo nixos-install --flake .#[host] --root /mnt
mkdir boot
sudo mount /dev/mmcblc... boot
cp -r boot/*
```

## References

- https://carjorvaz.com/posts/nixos-on-raspberry-pi-4-with-uefi-and-zfs/

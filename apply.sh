#!/bin/sh

sudo nixos-rebuild --flake ".#${HOST}" switch && reboot

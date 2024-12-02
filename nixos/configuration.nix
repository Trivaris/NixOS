{ config, lib, pkgs, ... }:

{

  # Import hardware configuration
  imports = [
    ./hardware-configuration.nix
    # ./home-manager.nix
  ];

  # Basic settings
  networking.hostName = "TrippleLaptop";
  time.timeZone = "Europe/Berlin";

  # User configuration
  users.users.trivaris = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Boot loader configuration
  boot.loader.grub.device = "/dev/sda"; 
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.gfxmodeEfi = "1024x768";

  # LUKS configuration
  boot.initrd.lvm = {
    devices = [ "volgroup0" ];
  };

  # Console settings
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  # Services configuration
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
  ];

  # SSH
  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = true;
    PermitRootLogin = "yes";
  };

  networking.wireless.enable = true;

  system.stateVersion = "24.11";

}

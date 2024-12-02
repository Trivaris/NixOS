{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/nvme0n1";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {

            /**********/
            boot = {
              type = "EF00";
              size = "512M";
              label = "boot";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };

            };
            /**********/
            encrypted = {
              size = "100%";
              label = "encrypted";

              content = {
                name = "crypted";
                type = "luks";

                settings = {
                  keyFile = "/tmp/secret.key";
                  allowDiscards = true;
                };

                content = {
                  type = "lvm_pv";
                  vg = "volgroup0";
                };

              };
            };#
            /**********/

          };
        };
      };
    };

    lvm_vg = {
      volgroup0 = {
        type = "lvm_vg";

        lvs = {

          /**********/
          swap = {
            size = "8G";
            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };
          /**********/
          lv_root = {
            size = "30G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          /**********/
          lv_home = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
          /**********/

        };
      };
    };
  };
}
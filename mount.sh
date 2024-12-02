mount /dev/volgroup0/lv_root /mnt
mount /dev/volgroup0/lv_home /mnt/home
mount /dev/disk/by-label/boot /mnt/boot

swapon /dev/volgroup0/swap
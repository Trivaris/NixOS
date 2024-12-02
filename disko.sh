#!/bin/bash

# Ask user for input
read -p "Enter the disk to use: " disk
read -p "Enter the size of swap (e.g. 8G): " swap_size
read -p "Enter the size of root (e.g. 30G): " root_size

# The file to be updated
nix_file="disko.nix"

# Backup of original file
cp "$nix_file" "$nix_file.bak"

# Update Device
sed -i "s|device = \"/dev/nvme0n1\";|device = \"$device\";|g" "$nix_file"

# Update Swap-Size
sed -i "s|size = \"8G\";|size = \"$swap_size\";|g" "$nix_file"

# Update Root-Size
sed -i "s|size = \"30G\";|size = \"$root_size\";|g" "$nix_file"

echo "disko.nix was updated!"
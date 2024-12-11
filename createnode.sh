#!/bin/bash


echo "Enter location name: "
read location_name
echo "Enter a location description: "
read location_description
echo "Enter domain: "
read domain
echo "Enter the node name: "
read node_name
echo "Enter RAM (in MB): "
read ram
echo "Enter the maximum amount of disk space (in MB): "
read disk_space
echo "Enter Location Id: "
read locid
cd /var/www/pterodactyl || { echo "Directory not found"; exit 1; }

php artisan p:location:make <<EOF
$location_name
$location_description
EOF

php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF

echo "The location and node creation process is complete."

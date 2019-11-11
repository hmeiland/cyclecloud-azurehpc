#!/bin/bash

cat <<EOF >> /etc/yum.repos.d/azurehpc.repo
[azurehpc]
name=Azure General HPC Repository
baseurl=https://yumrepohpc.blob.core.windows.net/general
enabled=1
gpgcheck=0
EOF

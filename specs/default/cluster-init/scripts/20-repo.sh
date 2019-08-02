#!/bin/bash

cat <<EOF >> /etc/yum.repos.d/azurehpc.repo
[azurehpc]
name=Azure HPC Repository
baseurl=https://yumrepohpc.blob.core.windows.net/\$web
enabled=1
gpgcheck=0
EOF

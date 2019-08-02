#!/bin/bash

sudo yum install -y Lmod

echo "export MODULEPATH=/apps/modules/all:$MODULEPATH" >> /etc/bashrc
echo "export EASYBUILD_PREFIX=/apps" >> /etc/bashrc
echo "export EASYBUILD_ROBOT_PATHS=/apps/azure_eb:" >> /etc/bashrc

cat <<EOF >> /etc/bashrc
get_ib_pkey()
{
    key0=\$(cat /sys/class/infiniband/mlx5_0/ports/1/pkeys/0)
    key1=\$(cat /sys/class/infiniband/mlx5_0/ports/1/pkeys/1)

    if [ \$((\$key0 - \$key1)) -gt 0 ]; then
        export IB_PKEY=\$key0
    else
        export IB_PKEY=\$key1
    fi

    export UCX_IB_PKEY=\$(printf '0x%04x' "\$(( \$IB_PKEY & 0x0FFF ))")
}
get_ib_pkey
EOF

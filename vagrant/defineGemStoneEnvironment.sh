#!/bin/bash -e

cat <<'EOF' >> $HOME/.profile
    export GEMSTONE=/opt/gemstone/GemStone64Bit3.4.0-x86_64.Linux
    export LD_LIBRARY_PATH=$GEMSTONE/lib
    . $GEMSTONE/bin/gemsetup.sh  
EOF

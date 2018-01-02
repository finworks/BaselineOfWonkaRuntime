#!/bin/bash -e

export INITIAL_EXTENT=$GEMSTONE/bin/extent0.seaside.dbf
export SETUP_OPTIONS=topaz/setupNoNetwork.topaz
export OVER_NETWORK=false
export LOAD_SCRIPT=topaz/makeCIImage.topaz

while getopts "e:ns" opt; do
    case $opt in
        e) 
           export INITIAL_EXTENT="$OPTARG"
           ;;
        n) 
           export SETUP_OPTIONS=topaz/setupOverNetwork.topaz
           export OVER_NETWORK=true
           ;;
        s) 
           export LOAD_SCRIPT=topaz/makeCIImageUsingStandardTools.topaz
           ;;
        *)
           echo "Usage: $(basename $0) [-e initial_extent] [-n (means over-network, defaults to using local stuff)] [-s (means, use GsUpgrader and Metacello without the Wonka scripts)]"
           exit 1
           ;;
    esac
done

echo Starting from extent: $INITIAL_EXTENT
echo Using options from: $SETUP_OPTIONS
echo Using load script:: $LOAD_SCRIPT

set -x
exit 0

stopstone -i -t 1 gs64stone DataCurator swordfish || true
kill -9 $(pidof stoned) || true
cp $INITIAL_EXTENT $GEMSTONE/data/extent0.dbf
chmod u+rw $GEMSTONE/data/extent0.dbf

startstone gs64stone -N
if $OVER_NETWORK; then
    rm -rf /vagrant/3rdparty/GemStone3.4/*
fi


topaz -l  < $SETUP_OPTIONS
topaz -l  < $LOAD_SCRIPT

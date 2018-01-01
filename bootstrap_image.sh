#!/bin/bash -xe

export INITIAL_EXTENT=$GEMSTONE/bin/extent0.seaside.dbf
export SETUP_OPTIONS=topaz/setupNoNetwork.topaz

while getopts "e:n" opt; do
    case $opt in
        e) 
           export INITIAL_EXTENT="$OPTARG"
           ;;
        n) 
           export SETUP_OPTIONS=topaz/setupOverNetwork.topaz
           ;;
        *)
           echo "Usage: $(basename $0) [-e initial_extent] [-n (means over-network, defaults to using local stuff)]"
           exit 1
           ;;
    esac
done

echo $INITIAL_EXTENT
echo $SETUP_OPTIONS

stopstone -i -t 1 gs64stone DataCurator swordfish || true
kill -9 $(pidof stoned) || true
cp $INITIAL_EXTENT $GEMSTONE/data/extent0.dbf
chmod u+rw $GEMSTONE/data/extent0.dbf

startstone gs64stone -N
rm -rf /vagrant/3rdparty/GemStone3.4/*


topaz -l  < $SETUP_OPTIONS
topaz -l  < /vagrant/topaz/makeCIImage.topaz

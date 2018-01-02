
BaselineOfWonkaRuntime
======================

This is just an extract of some of our scripts that can be used to
load all our 3rdparty dependencies into an image, based on our
baseline: BaselineOfWonkaProjects.

It does not work in its current state, but save for the baseline..st 
method itself, it has been in use on GS3.2 from some years now, 
albeit not in "over the network" mode.

.. warning:: The code represents several attempts by several people over the years to work around all kinds of problems while trying to do this. Its not pretty. 


To play with it:
~~~~~~~~~~~~~~~~

1. Clone the project.
2. Do a `git submodule update --init`
3. Do a `vagrant up`

Our requirements:
~~~~~~~~~~~~~~~~~

... are basically captured in the script `./bootstrap_image.sh`.

Run it from inside the vagrant machine, from `/vagrant':

`./bootstrap_image.sh -n` loads everything, fetching via the network and storing what it fetches in `3rdparty/GemStone3.4`.
`./bootstrap_image.sh` loads everything, from what was fetched to `3rdparty/GemStone3.4` previously.

You can use `-e file_path` to specify a particular extent to use as starting point. By default $GEMSTONE/bin/extent0.seaside.dbf is used.
The idea is to be able to give it a production extent too, in which case it will upgraded to what is specified in the baseline.




Using only standard tools
~~~~~~~~~~~~~~~~~~~~~~~~~

By default this loads using WonkaLoader, but passing -s to `./bootstrap_image.sh` makes it use topaz/makeCIImageUsingStandardTools.topaz
instead, which only uses standard tools.



             
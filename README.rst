
BaselineOfWonkaRuntime
======================

This is just an extract of some of our scripts that can be used to
load all our 3rdparty dependencies into an image, based on our
baseline: BaselineOfWonkaProjects.

.. warning:: The code represents several attempts by several people
             over the years to work around all kinds of problems while
             trying to do this. Its not pretty.

Status
~~~~~~

The code as per the first commit (note the baseline..st in it) has
been in use for a few years on GS3.2 but it stopped working in "over
the network mode".

As per this commit, I got it to load using WonkaLoader on GS3.4 and
3.2 overTheNetwork by adding the DataStream and DoubleByteString
methods as extensions.

I don't have it working loading via a more simple straight usage of
GsUpgrader and Monticello fetch/load ... which I would have liked to
do.

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



             

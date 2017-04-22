NANOSVG\_AFL
===========

Synopsis
--------
NanoSVG\_AFL is a project whose target is to fuzz the [nanosvg
project](https://github.com/memononen/nanosvg) and find crashes, triggered by
bugs. The fuzzing is performed with [afl-fuzz](http://lcamtuf.coredump.cx/afl).
After finding the crashes, we minimize them and then we verify that these
crashes are not false positives.

Motivation
----------
The reason of the existence of this project is an assignment of the course
"Software Testing and Reverse Engineering" for TU Delft. For this assignment,
it is necessary to fuzz an open source project, find bugs and patch them.

Installation
------------
One can get NanoSVG\_AFL easily by just cloning our project. Specifically, in a
Linux terminal one should run:

        git clone --recursive https://github.com/EliaGeretto/nanosvg_afl.git

After the successful cloning of the repository, a directory with name
`nanosvg_afl` should have been created. The directory contains:

* Three scripts: `fuzz.sh`, `minimize.sh` and `verify.sh`
* Two directories: `sdb` and `tests`
* A Makefile

NanoSVG\_AFL has been tested in Fedora 25 and Linux Mint 18 both in 64 bit.
There are some prerequisites before running our scripts.

_For Fedora the following packages are needed:_

        sudo dnf install afl-fuzz glibc-devel.i686 libstdc++-devel.i686 libasan.i686

_For Linux Mint the following Ubuntu packages are needed:_

        sudo apt-get install afl-fuzz linux-libc-dev:i386 libx32gcc-4.8-dev libc6-dev-i386 gcc-multilib g++-multilib libasan2

Instructions for correct running
--------------------------------
In order to grant full reproducibility of our work, three scripts were built.
Each of the three scripts is responsible for a different operation. First,
`fuzzing.sh` should be run. If all the required libraries are installed the sdb
project, placed in the sdb directory, will be compiled using `afl-gcc` in 32
bits with ASAN instrumentation. Then the fuzzing will be started with a memory
limit of 800 MB. As a test case AFL will choose the file inside the tests
directory.

***NOTE:*** _AFL may ask you to run some extra commands before
starting the fuzzing. Just follow the instructions provided._

When the fuzzing process is terminated (it is suggested to stop it after at
least 1 cycle) the `minimize.sh` script should be run. This script will minimize
the test cases produced and will delete the duplicates. The minimize script is based
on the `afl-tmin` command. All the minimized crashes will be saved in a new
directory called `minimized`. Finally, the `verify.sh` script should be run in
order to validate that the minimized crashes found are not false positives.

Contributors
------------

[EliaGeretto](https://github.com/EliaGeretto), [Djack1010](https://github.com/Djack1010), [atoptsoglou](https://github.com/atoptsoglou)

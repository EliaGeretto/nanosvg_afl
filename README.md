nanosvg_afl
===========
Synopsis
--------
Nanosvg_afl is a project which its target is to fuzz the [nanosvg project](https://github.com/memononen/nanosvg) and find crashes, triggered by bugs. The fuzzing is performed with [afl-fuzz](http://lcamtuf.coredump.cx/afl). After finding the crashes, we minimized them and then we verify that these crashes are not false positives.

Motivation
----------

The real purpose of the existence of this project is an assignment of the course Software Testing and Reverse Engineering for TU Delft. For this assignment, it is necessary to fuzz an open source project, to find bugs and patch them.

Installation
------------

One can get nanosvg_afl easily by just cloning our project. Specifically, in a Linux terminal one should run: 

`git clone --recursive https://github.com/EliaGeretto/nanosvg_afl.git`

After the successful git clone, a directory with name nanosvg_afl should have been placed in the directory that the previous command was run. The directory contains: 

* 3 scripts: fuzz.sh, minimize.sh and verify.sh  
* 2 directories: src and tests  
* 1 make file  

Nanosvg_afl has been tested in Fedora 25 and Linux Mint 18 both in 64 bit. There are some prerequisites before running our scripts. 
_For Fedora the following packages are needed:_ 

* `sudo dnf install afl-fuzz` --> installs the afl 
* `sudo dnf install glibc-devel.i686` 
* `sudo dnf install libstdc++-devel.i686` 
* `sudo dnf install libasan.i686` 

_For Linux Mint the following Ubuntu packages are needed:_ 

* `sudo apt-get install afl-fuzz` --> installs the afl 
* `sudo apt-get install linux-libc-dev:i386` 
* `sudo apt-get install libx32gcc-4.8-dev` 
* `sudo apt-get install libc6-dev-i386` 
* `sudo apt-get install gcc-multilib` 
* `sudo apt-get install g++-multilib` 
* `sudo apt-get install libasan2`

Instructions for correct running
--------------------------------

For a fast reproduction of our work, three scripts were built. Each of the three scripts is responsible for a different operation. First, the fuzzing.sh should be run. If all the required libraries are installed the sdb project, placed in the sdb directory, will be compiled with afl-gcc in 32 bits, with a limit of 800MB RAM and with ASAN instrumentation.Then the fuzzing will be started. As a test case the afl will choose the svg file inside the test directory. _**NOTE:** afl may ask you to run some extra commands before starting the fuzzing. Just follow afl's instructions._

When the fuzzing process is terminated (it is suggested after at least 1 cycle) the minimize.sh script should be run. This script will minimize the afl findings and will delete the duplicates. The minimize script is based on the "afl-tmin" command. All the minimized crashes will be saved in a new directory called minimized. Finally, the verify.sh script should be run in order to validate that the minimized crashes found are not false positives. 
All scripts should be run inside the directory nanosvg_afl with the following command:

`./script_name`

Contributors
------------

[EliaGeretto](https://github.com/EliaGeretto), [Djack1010](https://github.com/Djack1010), [atoptsoglou](https://github.com/atoptsoglou)

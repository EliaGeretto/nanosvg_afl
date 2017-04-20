# nanosvg_afl
<b><h2>Synopsis</h2></b>

Nanosvg_afl is a project which its target is to fuzz the <a href="https://github.com/memononen/nanosvg">nanosvg project </a> and find crashes,
triggered by bugs. The fuzzing is performed with <a href="http://lcamtuf.coredump.cx/afl">afl-fuzz </a>. fter finding the crashes, we minimized them and
then we verify that these crashes are not false positives.

<b><h2>Motivation</h2></b>

The real purpose of the existence of this project is an assignment of the course
Software Testing and Reverse Engineering for TU Delft. For this assignment, it
is necessary to fuzz an open source project, to find bugs and patch them.

<b><h2>Installation</h2></b>

One can get nanosvg_afl easily by just cloning our project. Specifically, in a Linux
terminal one should run:

`git clone --recursive https://github.com/EliaGeretto/nanosvg_afl.git`

<p>After the successful git clone, a directory with name nanosvg_afl should have been
placed in the directory that the previous command was run. The directory contains:<br>
3 scripts: fuzz.sh, minimize.sh and verify.sh<br>
2 directories: src and tests<br>
1 make file<br>

Nanosvg_afl has been tested in Fedora 25 and Linux Mint 18 both in 64 bit. There are
some prerequisites before running our scripts.

<i>For Fedora the following packages are needed: </i>

1) `sudo dnf install afl-fuzz` --> installs the afl
2) `sudo dnf install glibc-devel.i686`
3) `sudo dnf install libstdc++-devel.i686`
4) `sudo dnf install libasan.i686`

<i>For Linux Mint the following Ubuntu packages are needed:</i>

1) `sudo apt-get install afl-fuzz`  --> installs the afl
2) `sudo apt-get  install linux-libc-dev:i386`
3) `sudo apt-get  install libx32gcc-4.8-dev`
4) `sudo apt-get  install libc6-dev-i386`
5) `sudo apt-get  install gcc-multilib`
6) `sudo apt-get  install g++-multilib`
7) `sudo apt-get install libasan2`


<b><h2>Instructions for correct running</h2></b>

<p>For a fast reproduction of our work, three scripts were built. Each of the three
scripts is responsible for a different operation. First, the fuzzing.sh should
be run. If all the required libraries are installed the sdb project, placed in
the sdb directory, will be compiled with afl-gcc in 32 bits, with a limit of
800MB RAM and with ASAN instrumentation.Then the fuzzing will be started. As a test case the afl will choose the
svg file inside the test directory.
<i><b>NOTE:</b> afl may ask you to run some extra commands before starting the fuzzing. Just follow afl's instructions.</i>
<p>When the fuzzing process is terminated (it is suggested after at least 1 cycle)
the minimize.sh script should be run. This script will minimize the afl findings
and will delete the duplicates. The minimize script is based on the "afl-tmin"
command. All the minimized crashes will be saved in a new directory called
minimized. Finally, the verify.sh script should be run in order to validate that
the minimized crashes found are not false positives.All scripts should be run
inside the directory nanosvg_afl with the following command:

`./script_name`

<b><h2>Contributors</h2></b>

<a href="https://github.com/EliaGeretto">EliaGeretto</a>, <a href="https://github.com/Djack1010">Djack1010</a>, <a href="https://github.com/atoptsoglou">atoptsoglou</a>

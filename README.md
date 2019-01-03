# octave-BUILD

This repo contains my tools for building Octave.

## Usage

To use it, check out this repo next to the octave repo. 

```
hg clone https://www.octave.org/hg/octave
git clone https://github.com/apjanke/octave-BUILD
```

Make a new subdirectory called `build`, cd into it, and run one of the `my_configure*` scripts from there, and then `make`.

```
cd octave-BUILD
mkdir build
cd build
. ../my_configure.sh
make
```
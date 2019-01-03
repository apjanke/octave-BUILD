# octave-BUILD

This repo contains my tools for building Octave.

## Usage

To use it, check out this repo next to the octave repo. 

```
hg clone https://www.octave.org/hg/octave
git clone https://github.com/apjanke/octave-BUILD
```

Install Octave's dependencies using Homebrew.

```
brew tap octave-app/octave-app-bases
brew install --only-dependencies octave-head-test
```

Bootstrap the Octave source tree.

```
cd octave
./bootstrap
cd ..
```

Then, in octave-BUILD, make a new subdirectory called `build`, cd into it, source one of the `configure_*` scripts from there, and then `make`.

```
cd octave-BUILD
mkdir build
cd build
. ../configure_octave.sh
make V=1 -j 8
```
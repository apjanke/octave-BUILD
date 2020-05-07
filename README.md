# octave-BUILD

This repo contains my tools for building Octave.

This repo is for hackers who want to work on Octave’s source code itself.
If you just want a working Octave, you’re better off using [Octave.app](https://octave-app.org) or one of the Octave Homebrew formulae, like `brew install octave` or `brew tap octave-app/octave-app; brew install octave-octave-app`.

## Usage

To use it, check out this repo next to the octave Mercurial repo.

```bash
hg clone https://www.octave.org/hg/octave
git clone https://github.com/apjanke/octave-BUILD
```

Install Octave’s dependencies using Homebrew.

```bash
brew tap octave-app/octave-app
brew install --only-dependencies octave-default
```

Bootstrap the Octave source tree.

```bash
cd octave
./bootstrap
cd ..
```

Then, in octave-BUILD, make a new subdirectory called `build`, cd into it, source one of the `configure_*` scripts from there, and then `make`.

```bash
cd octave-BUILD
mkdir build
cd build
. ../configure_octave.sh
make V=1 -j 8
```

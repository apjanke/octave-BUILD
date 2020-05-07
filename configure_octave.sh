# Configures Octave against Homebrew-installed dependencies, including
# Homebrew-installed Qt.
#
# You should source this file, instead of running it as a command.
# It will leave environment variables set up for you that you may
# need during the subsequent `make` step.

brew_opt="$(brew --prefix)/opt"

# Use clang just to be more like Homebrew, so we can have nicer diffs
# of our build log output.
export CC=clang
export CXX=clang++

export YACC=$brew_opt/bison/bin/yacc

## Set Java home directory
export JAVA_HOME="$(/usr/libexec/java_home -v 9)"

# Force use of Homebrewed Ghostscript to avoid 
# "GPL Ghostscript 9.21: Can't find initialization file gs_init.ps"
# error that happens with Ghostscript distribution install
export GHOSTSCRIPT="$(brew --prefix ghostscript)/bin/gs"

# Qt 5.12 compatibility hack
export QCOLLECTIONGENERATOR="qhelpgenerator"

# Set up keg-only dependencies that are not linked by Homebrew
# Not all of these are actually required to build, but I'm trying to
# get my build environment here closer to the Homebrewed octave-default
# environment, to make debugging easier

PATH="$brew_opt/coreutils/bin:$PATH"
PATH="$brew_opt/findutils/bin:$PATH"
PATH="$brew_opt/qt/bin:$PATH"
PATH="$brew_opt/texinfo/bin:$PATH"

export PKG_CONFIG_PATH=""
export CPPFLAGS=""
export LDFLAGS=""
# Gettext is temporarily disabled to help me debug a CoreFoundation linkage error
#LDFLAGS="$LDFLAGS -L${brew_opt}/gettext/lib"
#CPPFLAGS="$CPPFLAGS -I${brew_opt}/gettext/include"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/icu4c/lib/pkgconfig"
LDFLAGS="$LDFLAGS -L${brew_opt}/libffi/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qrupdate/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qrupdate/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qscintilla2/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qscintilla2/lib"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/qt/lib/pkgconfig"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qt/include"
LDFLAGS="$LDFLAGS -F${brew_opt}/qt/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/readline/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/readline/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/sundials/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/sundials/lib"

# Docs are disabled because of a crash in the build
../../octave/configure \
  --prefix=/tmp/test-octave \
  --without-x \
  --disable-no-undefined \
  --without-fltk \
  --with-qt=5 \
  --with-hdf5-includedir=$brew_opt/hdf5/include \
  --with-hdf5-libdir=$brew_opt/hdf5/lib \
  --with-blas="-L${brew_opt}/veclibfort/lib -lvecLibFort" \
  | tee ../log/configure.log

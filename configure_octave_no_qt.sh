#!/bin/bash
#
# Builds against Homebrew-installed dependencies, and does not
# use Qt.

brew_opt="$(brew --prefix)/opt"

#export PATH=$brew_opt/bison/bin:$PATH
export YACC=$brew_opt/bison/bin/yacc

## Set Java home directory
export JAVA_HOME="$(/usr/libexec/java_home -v 9)"

# Set up dependencies that are not linked by Homebrew

PATH="$brew_opt/texinfo/bin:$PATH"

LDFLAGS=""
CPPFLAGS=""
LDFLAGS="$LDFLAGS -L${brew_opt}/readline/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/readline/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/gettext/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/gettext/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/libffi/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/sundials/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/sundials/lib"
export LDFLAGS
export CPPFLAGS


PKG_CONFIG_PATH=""
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/icu4c/lib/pkgconfig"
export PKG_CONFIG_PATH


../../octave/configure \
  --prefix=/tmp/test-octave \
  --without-x \
  --disable-no-undefined \
  --disable-docs \
  --without-fltk \
  --without-qt \
  --with-hdf5-includedir=$brew_opt/hdf5/include \
  --with-hdf5-libdir=$brew_opt/hdf5/lib \
  --with-blas="-L${brew_opt}/veclibfort/lib -lvecLibFort" \
  | tee config.out

#!/bin/bash
#
# Builds Octave against Homebrew-installed dependencies, including
# Homebrew-installed Qt.


brew_opt="$(brew --prefix)/opt"

#export PATH=$brew_opt/bison/bin:$PATH
export YACC=$brew_opt/bison/bin/yacc

## Set Java home directory
export JAVA_HOME="$(/usr/libexec/java_home -v 9)"

# Force use of Homebrewed Ghostscript to avoid 
# "GPL Ghostscript 9.21: Can't find initialization file gs_init.ps."
# error that happens with Ghostscript distribution install
export GHOSTSCRIPT="$(brew --prefix ghostscript)/bin/gs"

# Qt 5.12 compatibility hack
export QCOLLECTIONGENERATOR="qhelpgenerator"
#export QT_CPPFLAGS="-I$(brew --prefix qt)/include}"
#export QT_LDFLAGS="-F$(brew --prefix qt)/lib}"

# Set up dependencies that are not linked by Homebrew

PATH="$brew_opt/texinfo/bin:$PATH"
PATH="$brew_opt/qt/bin:$PATH"

export LDFLAGS=""
export CPPFLAGS=""
LDFLAGS="$LDFLAGS -L${brew_opt}/readline/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/readline/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/gettext/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/gettext/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/libffi/lib"
LDFLAGS="$LDFLAGS -F${brew_opt}/qt/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qt/include"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/sundials27/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/sundials27/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qscintilla2/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qscintilla2/lib"
# Qt 5.12 compatibility hack
#CPPFLAGS="$CPPFLAGS $QT_CPPFLAGS"
#LDFLAGS="$LDFLAGS $QT_LDFLAGS"

PKG_CONFIG_PATH=""
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/icu4c/lib/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/qt/lib/pkgconfig"
export PKG_CONFIG_PATH

# Docs are disabled because of a crash in the build
#  --disable-docs \
../../octave/configure \
  --prefix=/tmp/test-octave \
  --without-x \
  --disable-no-undefined \
  --without-fltk \
  --with-qt=5 \
  --with-hdf5-includedir=$brew_opt/hdf5/include \
  --with-hdf5-libdir=$brew_opt/hdf5/lib \
  --with-blas="-L${brew_opt}/veclibfort/lib -lvecLibFort" \
  | tee config.out

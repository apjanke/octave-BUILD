# Builds Octave against Homebrew-installed dependencies, including
# Homebrew-installed Qt.
#
# You should source this file, instead of running it as a command.
# It will leave environment variables set up for you that you may
# need during the subsequent `make` step.


brew_opt="$(brew --prefix)/opt"

#export PATH=$brew_opt/bison/bin:$PATH
export YACC=$brew_opt/bison/bin/yacc

## Set Java home directory
export JAVA_HOME="$(/usr/libexec/java_home -v 9)"

# Force use of Homebrewed Ghostscript to avoid 
# "GPL Ghostscript 9.21: Can't find initialization file gs_init.ps"
# error that happens with Ghostscript distribution install
export GHOSTSCRIPT="$(brew --prefix ghostscript)/bin/gs"

# Our "vanilla" Qt installation
QT_PREFIX=/usr/local/opt/qt-vanilla

# Qt 5.12 compatibility hack
export QCOLLECTIONGENERATOR="qhelpgenerator"

export PKG_CONFIG_PATH=""
export CPPFLAGS=""
export LDFLAGS=""

# Make our Qt available
PATH="$QT_PREFIX/bin:$PATH"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${QT_PREFIX}/lib/pkgconfig"
CPPFLAGS="$CPPFLAGS -I${QT_PREFIX}/include"
LDFLAGS="$LDFLAGS -L${QT_PREFIX}/lib"

# Set up dependencies that are not linked by Homebrew
# (i.e. keg-only dependencies)

PATH="$brew_opt/coreutils/bin:$PATH"
PATH="$brew_opt/findutils/bin:$PATH"
PATH="$brew_opt/texinfo/bin:$PATH"

PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/icu4c/lib/pkgconfig"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/gettext/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/gettext/lib"
LDFLAGS="$LDFLAGS -L${brew_opt}/libffi/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qrupdate/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qrupdate/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qscintilla2/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qscintilla2/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/readline/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/readline/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/sundials/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/sundials/lib"

../../octave/configure \
  --prefix=/tmp/test-octave \
  --without-x \
  --disable-no-undefined \
  --disable-docs \
  --without-osmesa \
  --without-fltk \
  --with-qt=5 \
  --with-hdf5-includedir=$brew_opt/hdf5/include \
  --with-hdf5-libdir=$brew_opt/hdf5/lib \
  --with-blas="-L${brew_opt}/veclibfort/lib -lvecLibFort" \
  | tee config.out

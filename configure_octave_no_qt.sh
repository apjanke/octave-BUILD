# Builds against Homebrew-installed dependencies, and does not use Qt.
#
# You should source this file, instead of running it as a command.
# It will leave environment variables set up for you that you may
# need during the subsequent `make` step.

brew_opt="$(brew --prefix)/opt"

#export PATH=$brew_opt/bison/bin:$PATH
export YACC=$brew_opt/bison/bin/yacc

## Set Java home directory
export JAVA_HOME="$(/usr/libexec/java_home -v 9)"

# Set up keg-only dependencies that are not linked by Homebrew

PATH="$brew_opt/coreutils/bin:$PATH"
PATH="$brew_opt/findutils/bin:$PATH"
PATH="$brew_opt/texinfo/bin:$PATH"

export PKG_CONFIG_PATH=""
export CPPFLAGS=""
export LDFLAGS=""
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:${brew_opt}/icu4c/lib/pkgconfig"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/gettext/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/gettext/lib"
LDFLAGS="$LDFLAGS -L${brew_opt}/libffi/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/qrupdate/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/qrupdate/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/readline/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/readline/lib"
CPPFLAGS="$CPPFLAGS -I${brew_opt}/sundials/include"
LDFLAGS="$LDFLAGS -L${brew_opt}/sundials/lib"


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

# Configures a vanilla (non-Homebrewed) Qt installation.
#
# Run this from within your Qt source tree.

QT_PREFIX=/usr/local/opt/qt-vanilla

./configure \
  -verbose \
  -prefix "$QT_PREFIX" \
  -release \
  -opensource -confirm-license \
  -system-zlib \
  -qt-libpng \
  -qt-libjpeg \
  -qt-freetype \
  -qt-pcre \
  -nomake examples \
  -nomake tests \
  -no-rpath \
  -pkg-config \
  -dbus-runtime \
  -proprietary-codecs | tee configure.out
#!/bin/bash
#
# This is a wrapper to call instead of make, which you need because
# you need to get some keg-only utilities on the path. Call it while
# you're in the build/ subdirectory, after you've done ../configure_octave.sh.
#
# This script will work with either configure_octave.sh or configure_octave_vanilla_qt.sh.
# The configure_octave_no_qt.sh needs a corresponding make_octave_no_qt.sh to be
# written.
# 
# Examples:
#
# ../make_octave.sh

brew_opt="$(brew --prefix)/opt"

PATH="$brew_opt/coreutils/bin:$PATH"
PATH="$brew_opt/findutils/bin:$PATH"
PATH="$brew_opt/qt/bin:$PATH"
PATH="$brew_opt/texinfo/bin:$PATH"

echo PATH is now: $PATH

make $@ | tee ../log/build.log

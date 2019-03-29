project(Octave)
cmake_minimum_required(VERSION 3.13)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-Wall")

include_directories( src )
include_directories( liboctave )
include_directories( liboctave/array )
include_directories( liboctave/internal )
include_directories( liboctave/numeric )
include_directories( liboctave/operators )
include_directories( liboctave/system )
include_directories( liboctave/util )
include_directories( liboctave/wrappers )

include_directories( libinterp )
include_directories( libinterp/corefcn )
include_directories( libinterp/dldfcn )
include_directories( libinterp/octave-value )
include_directories( libinterp/operators )
include_directories( libinterp/parse-tree )
include_directories( libinterp/template-inst )

include_directories( libgui )
include_directories( libgui/graphics )
include_directories( libgui/kb-layouts )
include_directories( libgui/languages )
include_directories( libgui/qterminal )
include_directories( libgui/src )

include_directories( libgnu )
include_directories( libgnu/glthread )
include_directories( libgnu/malloc )
include_directories( libgnu/unicase )
include_directories( libgnu/uniconv )
include_directories( libgnu/unictype )
include_directories( libgnu/uninorm )
include_directories( libgnu/unistr )





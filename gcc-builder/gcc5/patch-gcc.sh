#!/bin/bash
##
##  Script: fetch-gcc.sh
##
##  This second-level script downloads the GCC sources, as well as any other
##  sources needed to build GCC.
##
##- Make sure we're in the same directory as this script.
##
export TOP_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $TOP_DIR

##- Get the GCC-related variables for this build.
##
source ./gcc-build-vars.sh

if [ -d patches ]
then
    echo "applaying patches from patches/"
    patch -p1 -f -i patches/*.patch
fi

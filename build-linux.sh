#!/bin/sh

QT_VER=5.15.2
QT_PATH=$HOME/Qt/$QT_VER/gcc_64

mkdir -p build
cd build
rm -rf *

cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$QT_PATH
make

make package


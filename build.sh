#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

git clone https://github.com/quickjs-ng/quickjs.git quickjs-ng --depth=1
cd quickjs-ng

cmake -S . -B build
cmake --build build

mkdir ../dist

cp -r ./build/*qjs* ../dist

cd ..

ls -lh dist

tar -czf ./qjs-${TARGET}.tar.gz -C dist .
ls -l ./qjs-${TARGET}.tar.gz
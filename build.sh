#!/bin/bash

git clone https://github.com/tfussell/xlnt xlnt-1.5.0

# clone missing dependency

pushd xlnt-1.5.0
pushd third-party
pushd libstudxml
git clone https://git.codesynthesis.com/libstudxml/libstudxml.git
popd
popd
popd

# build 

mkdir -p build/xlnt-1.5.0
pushd build

#XLS

pushd xlnt-1.5.0
cmake ../../xlnt-1.5.0 -DSTATIC_CRT=ON -DSTATIC=ON
cmake --build . 
popd

# example project

cmake .. -DBUILD_STATIC=ON
cmake --build . --parallel 9 
popd
#!bin/bash

rm -rf sundials*
wget http://computation.llnl.gov/projects/sundials/download/sundials-2.7.0.tar.gz
dtrx --one rename sundials-2.7.0.tar.gz
mv sundials-2.7.0 sundials_srcdir
mkdir sundials_builddir
cd sundials_builddir
rm -r CMake*
ccmake ../sundials_srcdir
make -j17
checkinstall
cd ..
rm -rf sundials*


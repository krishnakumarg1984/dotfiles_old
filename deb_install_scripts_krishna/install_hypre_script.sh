#!bin/bash
rm -rf hypre*
wget http://computation.llnl.gov/projects/hypre-scalable-linear-solvers-multigrid-methods/download/hypre-2.11.1.tar.gz
mv hypre-2.11.1.tar.gz hypre_src.tar.gz
dtrx --one rename hypre_src.tar.gz
rm hypre_src.tar.gz
cd hypre_src/src/cmbuild/
rm -r CMake*
ccmake ..
make -j17
checkinstall
cd ../../..
rm -rf hypre*


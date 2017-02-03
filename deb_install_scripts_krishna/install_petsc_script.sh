#!bin/bash
cd /home/kg314/
rm -rf petsc*
git clone -b maint https://bitbucket.org/petsc/petsc petsc
mv petsc/ petsc_installdir/
cd petsc_installdir
./configure
make PETSC_DIR=/home/kg314/petsc_installdir PETSC_ARCH=arch-linux2-c-debug all
make PETSC_DIR=/home/kg314/petsc_installdir PETSC_ARCH=arch-linux2-c-debug test
make PETSC_DIR=/home/kg314/petsc_installdir PETSC_ARCH=arch-linux2-c-debug streams

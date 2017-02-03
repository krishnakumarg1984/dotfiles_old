#!bin/bash
rm -rf super* 
wget http://crd-legacy.lbl.gov/~xiaoye/SuperLU/superlu_mt_3.1.tar.gz
mv superlu_mt_3.1.tar.gz superlu_mt.tar.gz
dtrx --one rename superlu_mt.tar.gz
rm superlu*.tar.gz
cd superlu_mt
vi make.inc
make -j17
checkinstall
cd ../
rm -rf superlu*


#pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
#git clone git://github.com/bmcage/odes.git odes
#sudo chown -R kg314 .
#cd odes
#python setup.py build
#python setup.py install
#cd ..
#rm -rf odes
#
svn checkout https://svn.jmodelica.org/assimulo/trunk
cd trunk
python setup.py install
cd ..
rm -rf trunk

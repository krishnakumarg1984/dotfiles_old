#!bin/bash
# replace all occurences of kg314 with your username

echo "Welcome to Krishna's post-install tools script !"
echo 'setxkbmap -option caps:none' >> /home/kg314/.profile

#apt-get install -y software-properties-common libxss1 libappindicator1 libindicator7 

#wget http://blog.anantshri.info/content/uploads/2010/09/add-apt-repository.sh.txt
#cp add-apt-repository.sh.txt /usr/sbin/add-apt-repository
#chmod o+x /usr/sbin/add-apt-repository
#chown root:root /usr/sbin/add-apt-repository
#add-apt-repository ppa:saiarcot895/myppa

#/bin/bash -c "$(curl -sL https://git.io/vokNn)" #installs apt-fast


##basic system update and remove unwanted packages
#apt-get -y --force-yes update
#apt-get -y --force-yes upgrade

## install vim, dtrx, htop
#apt-fast install -y vim
#apt-fast install -y dtrx
#apt-fast install -y htop
#apt-fast install -y arandr
#apt-fast install -y checkinstall --install-recommends
#apt-fast install -y rubygems --install-recommends
#gem install mdless

#rm -rf node*
#wget https://nodejs.org/dist/v7.5.0/node-v7.5.0.tar.gz
#dtrx node-v7.5.0.tar.gz
#chown -R kg314 .
#cd node-v7.5.0
#./configure
#make -j17
#make test
#make doc
#make install
#cd ..
#rm -rf node*

#npm install --global git-recall

#apt-fast install -y gnome-terminal 
#apt-fast install -y dconf-cli dconf-editor --install-recommends
#update-alternatives --config x-terminal-emulator

#git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/kg314/.bash_it

#apt-fast install -y thefuck --install-recommends
#apt-fast install -y silversearcher-ag --install-recommends
#apt-fast install -y tmux  --install-recommends
#apt-fast install -y explain  --install-recommends
#apt-fast install -y ssh --install-recommends
#apt-fast install -y fish --install-recommends

#apt-fast install -y ntfs-config scrounge-ntfs libfsntfs1 libfsntfs-utils --install-recommends
#apt-fast install -y undistract-me --install-recommends

## install build-essential
#apt-fast install -y build-essential
#apt-fast install -y cmake extra-cmake-modules cmake-doc cmake-curses-gui --install-recommends
#apt-fast install -y cross-config make-doc --install-recommends
#apt-fast install -y pkgconf python-pkgconfig --install-recommends
#apt-fast install -y libopenmpi-dev --install-recommends libhwloc-contrib-plugins openmpi-doc # should install a ton of dependencies , also should iunstall nvidia/other stuff !!
#apt-fast install -y nvidia-driver nvidia-cuda-mps # will install lots of stuff !!

#echo "export OMP_NUM_THREADS=64" >> ~/.bashrc
#source ~/.bashrc 

#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome*.deb
#rm google-chrome-stable_current_amd64

## install openblas and dependencies
#apt-fast install -y gfortran gfortran-6 libblas-dev libgfortran-6-dev libopenblas-base libopenblas-dev

## install lapack and dependencies
#apt-fast install -y liblapack-dev liblapacke libtmglib-dev libtmglib3 liblapack-doc liblapack-doc-man liblapack-test
#apt-fast install -y libsuperlu-dev libsuperlu-doc python-sparse python-sparse-examples --install-recommends
#apt-fast install -y libsuitesparse-dev libsuitesparse-doc --install-recommends
#apt-fast install -y libpetsc3.7-dev --install-recommends
#apt-fast install -y libf2c2-dev f2c --install-recommends
#apt-fast install -y valgrind --install-recommends

## install anaconda python2
#wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh
#chmod +x *.sh
#chown -R kg314:kg314 .
#./Anaconda2-4.3.0-Linux-x86_64.sh
#rm Anaconda2-4.3.0-Linux-x86_64.sh
#source ~/.bashrc

#install_hypre_script.sh

#install_hypre_script.sh
#install_petsc_script.sh
#install_sundials.sh
#install_superlu_mt_script.sh
#install_sundials.sh

#wget http://computation.llnl.gov/projects/sundials/download/sundials-2.6.2.tar.gz
#dtrx sundials-2.6.2.tar.gz
#chown -R kg314 .
#rm *.tar.gz
#cd sundials-2.6.2
#cd sundialsTB
#matlab &

#wget http://esd.mathworks.com/R2016b/Linux_x86_64/INST_091492/matlab_R2016b_glnxa64.zip 
#unzip matlab_R2016b_glnxa64.zip -d matlab_srcdir
#rm matlab_R2016b_glnxa64.zip
#cd matlab_R2016b_glnxa64
#install.sh
#rm -r matlab_R2016b_glnxa64

#apt-fast install -y matlab-support --install-recommends
#apt-fast install -y swig swig-doc swig-examples --install-recommends

#rm -r cas*
#wget https://sourceforge.net/projects/casadi/files/CasADi/3.1.1/linux/casadi-matlabR2014b-v3.1.1.tar.gz
#dtrx casadi-matlabR2014b-v3.1.1.tar.gz
#mv casadi-matlabR2014b-v3.1.1/ /home/kg314/casadi-matlab3p1p1/
#rm -r *.tar.gz

#rm -r cas*
#wget https://sourceforge.net/projects/casadi/files/CasADi/3.1.1/linux/casadi-py27-np1.9.1-v3.1.1.tar.gz
#dtrx casadi-py27-np1.9.1-v3.1.1.tar.gz
#chown -R kg314 .
#mv casadi-py27-np1.9.1-v3.1.1/ /home/kg314/casadi_py27_v3p1p1/
#echo "export PYTHONPATH=$PYTHONPATH:/home/kg314/casadi_py27_v3p1p1" >> /home/kg314/.bashrc
#rm -r cas*

#echo "export SUNDIALS_INST=/usr/local/sundials_install/" >> /home/kg314/.bashrc
#source /home/kg314/.bashrc

#apt-fast install -y python-rednose
#apt-fast install -y xrdp
#apt-fast install -y gtk2-engines-murrine

#rm -r *.zip
#wget http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip
#unzip MacBuntu-Wallpapers.zip -d /usr/share/backgrounds
#add-apt-repository ppa:noobslab/macbuntu
#apt-fast update
#apt-fast install -y macbuntu-os-icons-lts-v8
#apt-fast install -y macbuntu-os-ithemes-ithemes-v8
#wget https://github.com/Elbullazul/OS-X-El-Capitan/releases/download/v0.7/OS.X.El.Capitan.v0.7.zip
#unzip OS.X.El.Capitan.v0.7.zip -d /usr/share/icons/
#rm *.zip

#add-apt-repository ppa:webupd8team/y-ppa-manager
#apt-fast update
#vim /etc/apt/sources.list
#apt-fast update
#apt-fast install -y y-ppa-manager --allow-unauthenticated

#apt-fast install -y albert
#apt-fast install -y zathura
#apt-fast install -y tipa --install-recommends
#apt-fast install -y texlive --install-recommends
#apt-fast install -y texlive-metapost --install-recommends
#apt-fast install -y rubber --install-recommends
#apt-fast install -y pandoc --install-recommends
#apt-fast install -y texlive-publishers-doc texlive-fonts-extra-doc --install-recommends
#apt-fast install -y texlive-htmlxml texlive-htmlxml html2ps --install-recommends
#apt-fast install -y texlive-xetex  texlive-luatex --install-recommends
#apt-fast install -y lyx --install-recommends

#curl -OL https://bashhub.com/setup && bash setup
#curl -sLo- http://get.bpkg.io 
#basher
#apt-fast install -y xscreensaver-gl
#apt-fast install -y ncdu
#apt-fast install -y moreutils --install-recommends
#apt-fast install -y cloc --install-recommends

#rm -rf fzf
#git clone --depth=1 https://github.com/junegunn/fzf.git 
#chown -R kg314:kg314 .
#cd fzf
#./install
#cd ..
#rm -rf fzf

#apt-get install -y atop glances --install-recommends
#https://github.com/Xfennec/progress.git (cp toolbox)
#apt-fast install -y httpie

#curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
#curl https://sh.rustup.rs -sSf | sh #install tldr

#cargo install tealdeer
#fisher fzf edc/bass omf/thefuck omf/theme-bobthefish
#apt-fast install -y grc
#fisher done fat fin g2 get get_file_age getopts grc host_info humanize_duration menu omf/balias omf/ccache
#fisher transfer termcolours spin omf/theme omf/tab omf/percol omf/peco omf/pbcopy omf/msg omf/extract omf/export 

#apt-fast install -y meld

#git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=3600000000'

#curl -fLo /home/kg314/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#apt-fast install -y python-jedi yapf
# apt-fast install -y vim-gtk3
# apt-fast install -y fonts-firacode

# apt-fast install -y gparted

# pip install  -e git+https://github.com/hplgit/physical-quantities.git#egg=physical-quantities

apt-get install -y i3

#apt-get install -f
#apt -y autoremove
#clear
#reboot

# switch to git file to have it
git checkout file

# create th tmp folder for the installation 
mkdir ~/tmp && cd ~/tmp

# install Code extension
code --install-extension akamud.vscode-theme-onedark
code --install-extension pkief.material-icon-theme

#install theme
git clone --depth 1 https://github.com/nana-4/materia-theme
cd materia-theme
sudo ./install.sh -g -c dark
cd ..

# remove tmp file
rm -rdf ~/tmp
sudo apt-get install pyqt5-dev-tools
pip install -r requirements/requirements-linux-python3.txt
make qt5py3

PROJECT_DIR=$(pwd)
echo export PATH_labelImg=\"${PROJECT_DIR}/work/labelImg\" >> ~/.bashrc
echo export PATH="$"{PATH}":$"{PATH_labelImg}"" >> ~/.bashrc
source ~/.bashrc

# In case you get error "Could not load the Qt platform plugin 'xcb' in '' even though it was found"
# sudo apt-get install libxcb-xinerama0

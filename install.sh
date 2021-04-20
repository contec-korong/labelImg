sudo apt-get install pyqt5-dev-tools
pip install -r requirements/requirements-linux-python3.txt
make qt5py3

PROJECT_DIR=$(pwd)
sudo echo export PATH_labelImg=\"/home/sjhong/work/labelImg\" >> ~/.bashrc
sudo echo export PATH="$"{PATH}":/usr/local/cuda-10.0/bin:$"{PATH_labelImg}"" >> ~/.bashrc
source ~/.bashrc

# In case you get error "Could not load the Qt platform plugin 'xcb' in '' even though it was found"
# sudo apt-get install libxcb-xinerama0

LabelImg
========

.. image:: https://img.shields.io/pypi/v/labelimg.svg
        :target: https://pypi.python.org/pypi/labelimg

.. image:: https://img.shields.io/travis/tzutalin/labelImg.svg
        :target: https://travis-ci.org/tzutalin/labelImg

.. image:: https://img.shields.io/badge/lang-en-blue.svg
        :target: https://github.com/tzutalin/labelImg/blob/master/README.zh.rst

.. image:: https://img.shields.io/badge/lang-zh-green.svg
        :target: https://github.com/tzutalin/labelImg/blob/master/readme/README.zh.rst

.. image:: https://img.shields.io/badge/lang-zh--TW-green.svg
    :target: (https://github.com/jonatasemidio/multilanguage-readme-pattern/blob/master/README.pt-br.md

.. image:: /resources/icons/app.png
    :width: 200px
    :align: center

LabelImg is a graphical image annotation tool.

It is written in Python and uses Qt for its graphical interface.

Annotations are saved as XML files in PASCAL VOC format, the format used
by `ImageNet <http://www.image-net.org/>`__.  Besides, it also supports YOLO and CreateML formats.

.. image:: https://raw.githubusercontent.com/tzutalin/labelImg/master/demo/demo3.jpg
     :alt: Demo Image

.. image:: https://raw.githubusercontent.com/tzutalin/labelImg/master/demo/demo.jpg
     :alt: Demo Image

`Watch a demo video <https://youtu.be/p0nR2YsCY_U>`__

Installation
------------------


Build from source
~~~~~~~~~~~~~~~~~

Linux/Ubuntu/Mac requires at least `Python
2.6 <https://www.python.org/getit/>`__ and has been tested with `PyQt
4.8 <https://www.riverbankcomputing.com/software/pyqt/intro>`__. However, `Python
3 or above <https://www.python.org/getit/>`__ and  `PyQt5 <https://pypi.org/project/PyQt5/>`__ are strongly recommended.


Ubuntu Linux
^^^^^^^^^^^^

Python 3 + Qt5

.. code:: shell

    sudo apt-get install pyqt5-dev-tools
    sudo pip3 install -r requirements/requirements-linux-python3.txt
    make qt5py3
    python3 labelImg.py
    python3 labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]

macOS
^^^^^

Python 3 + Qt5

.. code:: shell

    brew install qt  # Install qt-5.x.x by Homebrew
    brew install libxml2

    or using pip

    pip3 install pyqt5 lxml # Install qt and lxml by pip

    make qt5py3
    python3 labelImg.py
    python3 labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]


Python 3 Virtualenv (Recommended)

Virtualenv can avoid a lot of the QT / Python version issues

.. code:: shell

    brew install python3
    pip3 install pipenv
    pipenv run pip install pyqt5==5.12.1 lxml
    pipenv run make qt5py3
    pipenv run python3 labelImg.py
    [Optional] rm -rf build dist; python setup.py py2app -A;mv "dist/labelImg.app" /Applications

Note: The Last command gives you a nice .app file with a new SVG Icon in your /Applications folder. You can consider using the script: build-tools/build-for-macos.sh


Windows
^^^^^^^

Install `Python <https://www.python.org/downloads/windows/>`__,
`PyQt5 <https://www.riverbankcomputing.com/software/pyqt/download5>`__
and `install lxml <http://lxml.de/installation.html>`__.

Open cmd and go to the `labelImg <#labelimg>`__ directory

.. code:: shell

    pyrcc4 -o libs/resources.py resources.qrc
    For pyqt5, pyrcc5 -o libs/resources.py resources.qrc

    python labelImg.py
    python labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]

Windows + Anaconda
^^^^^^^^^^^^^^^^^^

Download and install `Anaconda <https://www.anaconda.com/download/#download>`__ (Python 3+)

Open the Anaconda Prompt and go to the `labelImg <#labelimg>`__ directory

.. code:: shell

    conda install pyqt=5
    conda install -c anaconda lxml
    pyrcc5 -o libs/resources.py resources.qrc
    python labelImg.py
    python labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]

Use Docker
~~~~~~~~~~~~~~~~~
.. code:: shell

    docker run -it \
    --user $(id -u) \
    -e DISPLAY=unix$DISPLAY \
    --workdir=$(pwd) \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tzutalin/py2qt4

    make qt4py2;./labelImg.py

You can pull the image which has all of the installed and required dependencies. `Watch a demo video <https://youtu.be/nw1GexJzbCI>`__


Usage
-----

Steps (PascalVOC)
~~~~~~~~~~~~~~~~~

1. Build and launch using the instructions above.
2. Click 'Change default saved annotation folder' in Menu/File
3. Click 'Open Dir'
4. Click 'Create RectBox'
5. Click and release left mouse to select a region to annotate the rect
   box
6. You can use right mouse to drag the rect box to copy or move it

The annotation will be saved to the folder you specify.

You can refer to the below hotkeys to speed up your workflow.

Create pre-defined classes
~~~~~~~~~~~~~~~~~~~~~~~~~~

You can edit the
`data/predefined\_classes.txt <https://github.com/tzutalin/labelImg/blob/master/data/predefined_classes.txt>`__
to load pre-defined classes

Hotkeys
~~~~~~~

+--------------------+------------------------------------------------+
| Ctrl + u           | Load all of the images from a directory        |
+--------------------+------------------------------------------------+
| Ctrl + r           | Change the default annotation target dir       |
+--------------------+------------------------------------------------+
| Ctrl + s           | Save                                           |
+--------------------+------------------------------------------------+
| Ctrl + d           | Copy the current label and rect box            |
+--------------------+------------------------------------------------+
| Ctrl + Shift + d   | Delete the current image                       |
+--------------------+------------------------------------------------+
| Space              | Flag the current image as verified             |
+--------------------+------------------------------------------------+
| w                  | Create a rect box                              |
+--------------------+------------------------------------------------+
| q                  | Create a box as the same class of the last one |
+--------------------+------------------------------------------------+
| d                  | Next image                                     |
+--------------------+------------------------------------------------+
| a                  | Previous image                                 |
+--------------------+------------------------------------------------+
| s                  | Remove selected box                            |
+--------------------+------------------------------------------------+
| Ctrl++             | Zoom in                                        |
+--------------------+------------------------------------------------+
| Ctrl--             | Zoom out                                       |
+--------------------+------------------------------------------------+
| ↑→↓←               | Keyboard arrows to move selected rect box      |
+--------------------+------------------------------------------------+


**Verify Image:**

When pressing space, the user can flag the image as verified, a green background will appear.
This is used when creating a dataset automatically, the user can then through all the pictures and flag them instead of annotate them.

**Difficult:**

The difficult field is set to 1 indicates that the object has been annotated as "difficult", for example, an object which is clearly visible but difficult to recognize without substantial use of context.
According to your deep neural network implementation, you can include or exclude difficult objects during training.

How to reset the settings
~~~~~~~~~~~~~~~~~~~~~~~~~

In case there are issues with loading the classes, you can either:

1. From the top menu of the labelimg click on Menu/File/Reset All
2. Remove the `.labelImgSettings.pkl` from your home directory. In Linux and Mac you can do:
    `rm ~/.labelImgSettings.pkl`


How to contribute
~~~~~~~~~~~~~~~~~

Send a pull request

License
~~~~~~~
`Free software: MIT license <https://github.com/tzutalin/labelImg/blob/master/LICENSE>`_

Citation: Tzutalin. LabelImg. Git code (2015). https://github.com/tzutalin/labelImg


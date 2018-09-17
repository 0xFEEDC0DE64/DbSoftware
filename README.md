# DbSoftware
Collection of various self-written tools &amp; libraries

# Building everything from source
```Shell
git clone --recursive https://github.com/0xFEEDC0DE64/DbSoftware.git
mkdir build_DbSoftware
cd build_DbSoftware
qmake CONFIG+=ccache ../DbSoftware
make -j$(nproc)
make install
```
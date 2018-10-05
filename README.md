# DbSoftware
Collection of various self-written tools &amp; libraries

[![Build Status](https://travis-ci.org/0xFEEDC0DE64/DbSoftware.svg?branch=master)](https://travis-ci.org/0xFEEDC0DE64/DbSoftware) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/d98f16ba75544c429f0b86482400f791)](https://www.codacy.com/app/0xFEEDC0DE64/DbSoftware?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=0xFEEDC0DE64/DbSoftware&amp;utm_campaign=Badge_Grade)

## Building everything from source
```Shell
git clone --recursive https://github.com/0xFEEDC0DE64/DbSoftware.git
mkdir build_DbSoftware
cd build_DbSoftware
qmake CONFIG+=ccache ../DbSoftware
make -j$(nproc)
make install
```

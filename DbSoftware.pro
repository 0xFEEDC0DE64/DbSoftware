TEMPLATE = subdirs

SUBDIRS += 3rdparty \
           DbDatabaseTree \
           DbHashCracker \
           DbMessaging \
           DbNeuralNet \
           DbPathFinder \
           DbPicSync \
           DbRadioDumper \
           DbSerialServer \
           DbSketch \
           DbTernaryClock \
           DbTictactoe \
           DbWebserver \
           DbZeiterfassung \
           libs

OTHER_FILES += app.pri \
               lib.pri \
               project.pri

DbTernaryClock.depends += libs
DbZeiterfassung.depends += DbSketch libs

include(installs.pri)
win32: include(installs_win32.pri)

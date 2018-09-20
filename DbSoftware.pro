TEMPLATE = subdirs

SUBDIRS += 3rdparty \
           DbDatabaseTree \
           DbHashCracker \
           DbMessaging \
           DbNeuralNet \
           DbPathFinder \
           DbPicSync \
           DbRadioDumper
qtHaveModule(serialport): SUBDIRS += DbSerialServer
else: message("serialport is missing, will not build DbSerialServer")
SUBDIRS += DbSketch \
           DbTernaryClock \
           DbTictactoe \
           DbWebserver \
           DbZeiterfassung \
           libs

OTHER_FILES += app.pri \
               lib.pri \
               project.pri

contains(SUBDIRS, DbSerialServer): DbSerialServer.depends += libs
DbSketch.depends += 3rdparty
DbTernaryClock.depends += libs
DbWebserver.depends += libs
DbZeiterfassung.depends += 3rdparty DbSketch libs

include(installs.pri)
win32: include(installs_win32.pri)

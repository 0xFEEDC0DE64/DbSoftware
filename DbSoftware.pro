TEMPLATE = subdirs

SUBDIRS += 3rdparty libs
exists(DbDatabaseTree/DbDatabaseTree.pro): SUBDIRS += DbDatabaseTree
exists(DbHashCracker/DbHashCracker.pro): SUBDIRS += DbHashCracker
exists(DbMessaging/DbMessaging.pro): SUBDIRS += DbMessaging
exists(DbNeuralNet/DbNeuralNet.pro): SUBDIRS += DbNeuralNet
exists(DbPathFinder/DbPathFinder.pro): SUBDIRS += DbPathFinder
exists(DbPicSync/DbPicSync.pro): SUBDIRS += DbPicSync
exists(DbRadioDumper/DbRadioDumper.pro): SUBDIRS += DbRadioDumper
exists(DbSerialServer/DbSerialServer.pro): {
    qtHaveModule(serialport): SUBDIRS += DbSerialServer
    else: message("serialport is missing, will not build DbSerialServer")
}
exists(DbSketch/DbSketch.pro): SUBDIRS += DbSketch
exists(DbTernaryClock/DbTernaryClock.pro): SUBDIRS += DbTernaryClock
exists(DbTictactoe/DbTictactoe.pro): SUBDIRS += DbTictactoe
exists(DbWebserver/DbWebserver.pro): SUBDIRS += DbWebserver
exists(DbZeiterfassung/DbZeiterfassung.pro): SUBDIRS += DbZeiterfassung

contains(SUBDIRS, DbSerialServer): DbSerialServer.depends += libs
contains(SUBDIRS, DbSketch): DbSketch.depends += 3rdparty
contains(SUBDIRS, DbTernaryClock): DbTernaryClock.depends += libs
contains(SUBDIRS, DbWebserver): DbWebserver.depends += libs
contains(SUBDIRS, DbZeiterfassung): DbZeiterfassung.depends += 3rdparty DbSketch libs

OTHER_FILES += app.pri \
               lib.pri \
               project.pri

include(installs.pri)
win32: include(installs_win32.pri)

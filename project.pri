CONFIG += qt warn_on depend_includepath c++14

QMAKE_TARGET_PRODUCT = "DbSoftware"
QMAKE_TARGET_DESCRIPTION = "$$TARGET"
QMAKE_TARGET_COMPANY = "brunner.ninja"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) by feedc0de"

DEFINES += QT_DEPRECATED_WARNINGS \
           QT_DISABLE_DEPRECATED_BEFORE=0x060000 \
           QT_MESSAGELOGCONTEXT

!isEmpty(DBLIBS) {
    win32: LIBS += -L$${OUT_PWD}/$${PROJECT_ROOT}/bin
    else: LIBS += -Wl,-rpath=\\\$$ORIGIN/../lib -L$${OUT_PWD}/$${PROJECT_ROOT}/lib
}

for(DBLIB, DBLIBS) {
    equals(DBLIB, "dbcore") {
        LIBS += -ldbcore

        INCLUDEPATH += $$PWD/libs/DbCoreLib
        DEPENDPATH += $$PWD/libs/DbCoreLib
    } else: equals(DBLIB, "dbgui") {
        LIBS += -ldbgui

        INCLUDEPATH += $$PWD/libs/DbGuiLib
        DEPENDPATH += $$PWD/libs/DbGuiLib
    } else: equals(DBLIB, "dbnetwork") {
        LIBS += -ldbnetwork

        INCLUDEPATH += $$PWD/libs/DbNetworkLib
        DEPENDPATH += $$PWD/libs/DbNetworkLib
    } else: equals(DBLIB, "messaginglib") {
        LIBS += -lmessaginglib

        INCLUDEPATH += $$PWD/DbMessaging/messaginglib
        DEPENDPATH += $$PWD/DbMessaging/messaginglib
    } else: equals(DBLIB, "neuralnetlib") {
        LIBS += -lneuralnetlib

        INCLUDEPATH += $$PWD/DbNeuralNet/neuralnetlib
        DEPENDPATH += $$PWD/DbNeuralNet/neuralnetlib
    } else: equals(DBLIB, "sketchlib") {
        LIBS += -lsketchlib

        INCLUDEPATH += $$PWD/DbSketch/sketchlib
        DEPENDPATH += $$PWD/DbSketch/sketchlib
    } else: equals(DBLIB, "webserverlib") {
        LIBS += -lwebserverlib

        INCLUDEPATH += $$PWD/DbWebserver/webserverlib
        DEPENDPATH += $$PWD/DbWebserver/webserverlib
    } else: equals(DBLIB, "zeiterfassungcore") {
        LIBS += -lzeiterfassungcore

        INCLUDEPATH += $$PWD/DbZeiterfassung/zeiterfassungcorelib
        DEPENDPATH += $$PWD/DbZeiterfassung/zeiterfassungcorelib
    } else: equals(DBLIB, "zeiterfassunggui") {
        LIBS += -lzeiterfassunggui

        INCLUDEPATH += $$PWD/DbZeiterfassung/zeiterfassungguilib
        DEPENDPATH += $$PWD/DbZeiterfassung/zeiterfassungguilib
    } else: equals(DBLIB, "quazip") {
        LIBS += -lquazip

        INCLUDEPATH += $$PWD/3rdparty/Quazip
        DEPENDPATH += $$PWD/3rdparty/Quazip
    } else: message("ERROR: Unknown dblib $$DBLIB")
}

isEmpty(QMAKE_LRELEASE) {
    win32:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]\lrelease.exe
    else:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease
}

lrelease.input = TRANSLATIONS
lrelease.output = $${OUT_PWD}/$${PROJECT_ROOT}/bin/translations/${QMAKE_FILE_BASE}.qm
lrelease.commands = $${QMAKE_LRELEASE} ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_OUT}
lrelease.CONFIG += no_link
QMAKE_EXTRA_COMPILERS += lrelease
PRE_TARGETDEPS += compiler_lrelease_make_all

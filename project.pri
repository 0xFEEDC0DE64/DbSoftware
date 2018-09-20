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

contains(DBLIBS, sketchlib): DBLIBS *= quazip
contains(DBLIBS, webserverlib): DBLIBS *= dbnetwork
contains(DBLIBS, zeiterfassunggui): DBLIBS *= dbcore

for(DBLIB, DBLIBS) {
    equals(DBLIB, dbcore) {
        LIBS += -ldbcore

        INCLUDEPATH += $${PROJECT_ROOT}/libs/DbCoreLib
        DEPENDPATH += $${PROJECT_ROOT}/libs/DbCoreLib
    } else: equals(DBLIB, dbgui) {
        LIBS += -ldbgui

        INCLUDEPATH += $${PROJECT_ROOT}/libs/DbGuiLib
        DEPENDPATH += $${PROJECT_ROOT}/libs/DbGuiLib
    } else: equals(DBLIB, dbnetwork) {
        LIBS += -ldbnetwork

        INCLUDEPATH += $${PROJECT_ROOT}/libs/DbNetworkLib
        DEPENDPATH += $${PROJECT_ROOT}/libs/DbNetworkLib
    } else: equals(DBLIB, messaginglib) {
        LIBS += -lmessaginglib

        INCLUDEPATH += $${PROJECT_ROOT}/DbMessaging/messaginglib
        DEPENDPATH += $${PROJECT_ROOT}/DbMessaging/messaginglib
    } else: equals(DBLIB, neuralnetlib) {
        LIBS += -lneuralnetlib

        INCLUDEPATH += $${PROJECT_ROOT}/DbNeuralNet/neuralnetlib
        DEPENDPATH += $${PROJECT_ROOT}/DbNeuralNet/neuralnetlib
    } else: equals(DBLIB, sketchlib) {
        LIBS += -lsketchlib

        INCLUDEPATH += $${PROJECT_ROOT}/DbSketch/sketchlib
        DEPENDPATH += $${PROJECT_ROOT}/DbSketch/sketchlib
    } else: equals(DBLIB, webserverlib) {
        LIBS += -lwebserverlib

        INCLUDEPATH += $${PROJECT_ROOT}/DbWebserver/webserverlib
        DEPENDPATH += $${PROJECT_ROOT}/DbWebserver/webserverlib
    } else: equals(DBLIB, zeiterfassungcore) {
        LIBS += -lzeiterfassungcore

        INCLUDEPATH += $${PROJECT_ROOT}/DbZeiterfassung/zeiterfassungcorelib
        DEPENDPATH += $${PROJECT_ROOT}/DbZeiterfassung/zeiterfassungcorelib
    } else: equals(DBLIB, zeiterfassunggui) {
        LIBS += -lzeiterfassunggui

        INCLUDEPATH += $${PROJECT_ROOT}/DbZeiterfassung/zeiterfassungguilib
        DEPENDPATH += $${PROJECT_ROOT}/DbZeiterfassung/zeiterfassungguilib
    } else: equals(DBLIB, quazip) {
        LIBS += -lquazip

        INCLUDEPATH += $${PROJECT_ROOT}/3rdparty/Quazip
        DEPENDPATH += $${PROJECT_ROOT}/3rdparty/Quazip
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

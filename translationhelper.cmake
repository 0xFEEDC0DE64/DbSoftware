find_package(Qt5Core CONFIG REQUIRED)

set(QT_TRANSLATIONS
    qt_en.qm
    qtbase_en.qm
    qtmultimedia_en.qm
    qtquick1_en.qm
    qtscript_en.qm
    qtxmlpatterns_en.qm
    qt_de.qm
    qtbase_de.qm
    qtmultimedia_de.qm
    qtquick1_de.qm
    qtscript_de.qm
    qtxmlpatterns_de.qm
)

get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake IMPORTED_LOCATION)

execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_TRANSLATIONS
                OUTPUT_VARIABLE QT_INSTALL_TRANSLATIONS
                OUTPUT_STRIP_TRAILING_WHITESPACE
)

PREPEND(QT_TRANSLATIONS ${QT_INSTALL_TRANSLATIONS}/ ${QT_TRANSLATIONS})

#list(TRANSFORM QT_TRANSLATIONS
#     PREPEND ${QT_INSTALL_TRANSLATIONS}/)

file(COPY ${QT_TRANSLATIONS}
     DESTINATION ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/translations)

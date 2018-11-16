cmake_minimum_required(VERSION 2.8.11)
project(DbSoftware)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

add_definitions(-DQT_DEPRECATED_WARNINGS)
add_definitions(-DQT_DISABLE_DEPRECATED_BEFORE=0x060000)
add_definitions(-DQT_MESSAGELOGCONTEXT)

find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5Gui CONFIG REQUIRED)
find_package(Qt5Widgets CONFIG REQUIRED)
find_package(Qt5Network CONFIG REQUIRED)
find_package(Qt5Sql CONFIG REQUIRED)
find_package(Qt5SerialPort CONFIG REQUIRED)
find_package(Qt5Multimedia CONFIG REQUIRED)
find_package(Qt5Test CONFIG REQUIRED)
find_package(Qt5UiTools CONFIG REQUIRED)
find_package(Qt5LinguistTools CONFIG REQUIRED)

FUNCTION(PREPEND var prefix)
   SET(listVar "")
   FOREACH(f ${ARGN})
      LIST(APPEND listVar "${prefix}/${f}")
   ENDFOREACH(f)
   SET(${var} "${listVar}" PARENT_SCOPE)
ENDFUNCTION(PREPEND)

FUNCTION(optional_add_subdirectory source_dir)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${source_dir}/CMakeLists.txt)
        add_subdirectory(${source_dir})
    endif()
ENDFUNCTION(optional_add_subdirectory)

add_subdirectory(3rdparty)
optional_add_subdirectory(DbDatabaseTree)
optional_add_subdirectory(DbHashCracker)
optional_add_subdirectory(DbMessaging)
optional_add_subdirectory(DbNeuralNet)
optional_add_subdirectory(DbPathFinder)
optional_add_subdirectory(DbPicSync)
optional_add_subdirectory(DbRadioDumper)
optional_add_subdirectory(DbSerialServer)
optional_add_subdirectory(DbSketch)
optional_add_subdirectory(DbTernaryClock)
optional_add_subdirectory(DbTictactoe)
optional_add_subdirectory(DbWebserver)
optional_add_subdirectory(DbZeiterfassung)
add_subdirectory(libs)

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

TEMPLATE = lib
win32: DESTDIR = $${OUT_PWD}/$${PROJECT_ROOT}/bin
else: DESTDIR = $${OUT_PWD}/$${PROJECT_ROOT}/lib
include(project.pri)

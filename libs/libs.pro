TEMPLATE = subdirs

SUBDIRS += DbCoreLib \
           DbGuiLib \
           unittests

unittests.depends += DbCoreLib

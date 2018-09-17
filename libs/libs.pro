TEMPLATE = subdirs

SUBDIRS += DbCoreLib \
           DbGuiLib \
           DbNetworkLib \
           unittests

unittests.depends += DbCoreLib

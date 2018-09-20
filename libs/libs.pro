TEMPLATE = subdirs

exists(DbCoreLib/DbCoreLib.pro): SUBDIRS += DbCoreLib
exists(DbGuiLib/DbGuiLib.pro): SUBDIRS += DbGuiLib
exists(DbNetworkLib/DbNetworkLib.pro): SUBDIRS += DbNetworkLib

SUBDIRS += unittests

unittests.depends += DbCoreLib

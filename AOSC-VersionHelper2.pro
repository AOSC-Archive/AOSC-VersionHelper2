QT_VERSION = $$[QT_VERSION]
QT_VERSION = $$split(QT_VERSION, ".")
QT_VER_MAJ = $$member(QT_VERSION, 0)
QT_VER_MIN = $$member(QT_VERSION, 1)

lessThan(QT_VER_MAJ, 5) | lessThan(QT_VER_MIN, 2) {
	error(AOSC-VersionHelper2 is only tested under Qt 5.2!)
}

QT += qml quick
!android: !ios: !blackberry: qtHaveModule(widgets): QT += widgets
TARGET = AOSC-VersionHelper2
CODECFORSRC = UTF-8
CONFIG += qtquickcompiler

include(cpp/src.pri)

OTHER_FILES +=              \
    qml/AOSC-VersionHelper2.qml

RESOURCES += \
    resources.qrc

unix {
    isEmpty(PREFIX) {
        PREFIX = /usr
    }
    
    BINDIR  = $$PREFIX/bin
    DATADIR = $$PREFIX/share

    DEFINES += PREFIX=\\\"$$PREFIX\\\"
    DEFINES += TARGET=\\\"$$TARGET\\\"
    DEFINES += DATADIR=\\\"$$DATADIR\\\" PKGDATADIR=\\\"$$PKGDATADIR\\\"

    INSTALLS += target desktop

    target.path = $$BINDIR

    desktop.path = $$DATADIR/applications
    desktop.files += $${TARGET}.desktop

    icon.path = $$DATADIR/icons/hicolor/256x256
    icon.files += images/$${TARGET}.png
}

#-------------------------------------------------
#
# Project created by QtCreator 2015-12-14T00:07:55
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MineSweep
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    MineMap.cpp

HEADERS  += mainwindow.h \
    MineMap.h

FORMS    += mainwindow.ui

RESOURCES += \
    hellores.qrc

DISTFILES += \
    README.md

CONFIG(release, debug|release) {
    TRANSLATIONS = $$files($$PWD/translations/*.ts)
    #遍历目录中的ts文件，调用lrelease将其生成为qm文件
    for(tsfile, TRANSLATIONS) {
        qmfile = $$replace(tsfile, .ts$, .qm)
        system(lrelease $$tsfile -qm $$qmfile) | error("Failed to lrelease")
    }
}

APPSHAREDIR = /usr/share/$$TARGET
unix:!android: target.path = /usr/bin

desktop.path = /usr/share/applications/
desktop.files = $$PWD/install/MineSweep.desktop

translations.path = $$APPSHAREDIR/translations
translations.files = $$PWD/translations/*.qm

icon.path =/usr/share/icons
icon.files=$$PWD/install/MineSweep.png

!isEmpty(target.path): INSTALLS += target icon desktop translations

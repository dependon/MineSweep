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
    MineMap.cpp \
    customdialog.cpp

HEADERS  += mainwindow.h \
    MineMap.h \
    customdialog.h

FORMS    += mainwindow.ui \
    customdialog.ui

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
#com.github.minesweep
APPSHAREDIR = /usr/share/$$TARGET
unix:!android: target.path = /opt/apps/com.github.minesweep/files/bin/

desktop.path = /opt/apps/com.github.minesweep/entries/applications
desktop.files = $$PWD/install/com.github.minesweep.desktop

translations.path = /opt/apps/com.github.minesweep/files/bin/translations
translations.files = $$PWD/translations/*.qm

icon.path =/opt/apps/com.github.minesweep/entries/icons
icon.files=$$PWD/install/MineSweep.svg

info.path=/opt/apps/com.github.minesweep/
info.files= $$PWD/info/*

!isEmpty(target.path): INSTALLS += target icon desktop translations info

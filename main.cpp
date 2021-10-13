#include "mainwindow.h"
#include <QApplication>

#include <QDir>
#include <QDir>
#include <QDirIterator>
#include <QTranslator>
#include <QDesktopWidget>

#define TRANSALTIONPATH "/usr/share/MineSweep/translations"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
#ifdef Q_OS_LINUX
    QDir dir(TRANSALTIONPATH);
    if (dir.exists()) {
        QDirIterator qmIt(TRANSALTIONPATH, QStringList() << QString("*%1.qm").arg(QLocale::system().name()), QDir::Files);
        while (qmIt.hasNext()) {
            qmIt.next();
            QFileInfo finfo = qmIt.fileInfo();
            QTranslator *translator = new QTranslator;
            if (translator->load(finfo.baseName(), finfo.absolutePath())) {
                qApp->installTranslator(translator);
            }
        }
    }
#endif
    MainWindow w;
    w.move(qApp->desktop()->screen()->rect().center() - w.rect().center());
    w.show();

    return a.exec();
}

// Copyright (C) 2014 AnthonOS Open Source Community

#include <QApplication>
#include <QtQml>
#include <QtQuick/QQuickView>

#include "afile.h"

int main(int argc, char* argv[]) 
{                                                                        
    QApplication app(argc, argv);
    app.setApplicationName("AOSC-VersionHelper");
    app.setApplicationVersion("2.0.0");
    app.setOrganizationName("AnthonOS Open Source Community");

    qmlRegisterType<AFile>("org.anthonos", 1, 0, "AFile");

    QQmlApplicationEngine engine(QUrl("qrc:/qml/AOSC-VersionHelper2.qml"));
    QObject* topLevel = engine.rootObjects().value(0);
    QQuickWindow* window = qobject_cast<QQuickWindow *>(topLevel);
    if (!window) {
        qWarning("ERROR: Your root item has to be a Window"); 
        return -1;
    }
    window->setTitle("AOSC-VersionHelper2");
    window->show();

    return app.exec();                                       
}

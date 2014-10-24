AOSC-VersionHelper2
===================

AOSC OS3 Version Helper


## How to use Qt Quick Compiler

1. Create a .qrc file, for example ./resources.qrc, for your application and 
include all the files your project needs, including .qml , .js and qmldir files.

2. Add the file name of your .qrc file to RESOURCES in your .pro file, 
for example ./AOSC-VersionHelper2.pro.

3. Change your application to use qrc: URLs instead of file: in order to become 
file system independent, for example, in ./cpp/main.cpp, we use

```
QQmlApplicationEngine engine(QUrl("qrc:/qml/AOSC-VersionHelper2.qml"));
```

4. you can activate the integration with the Qt Quick Compiler by passing 
```
CONFIG += qtquickcompiler
``` 
to qmake, for example on the command line or in the build settings of your 
project in Qt Creator, as additional argument in the qmake build steps.


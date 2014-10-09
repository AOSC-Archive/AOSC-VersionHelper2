// Copyright (C) 2014 AnthonOS Open Source Community

#ifndef __AFILE_H__
#define __AFILE_H__

#include <QObject>
#include <fstream>

class AFile : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString path READ getPath WRITE setPath)

public:
    AFile(QObject* parent = 0);
    ~AFile();

    QString getPath() const;
    void setPath(const QString & path);

Q_SIGNALS:
    void error();
    void finished(QString content);

private:
    QString m_path;
    std::ifstream m_ifile;
};

#endif  // __AFILE_H__

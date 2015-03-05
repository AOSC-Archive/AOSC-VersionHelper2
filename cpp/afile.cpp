// Copyright (C) 2014 - 2015 AnthonOS Open Source Community

#include <iostream>

#include "afile.h"

AFile::AFile(QObject* parent) 
  : QObject(parent), 
    m_path("") 
{
}

AFile::~AFile() 
{
    m_ifile.close(); 
}

QString AFile::getPath() const { return m_path; }

void AFile::setPath(const QString & path) 
{
    // play with std::cpp ;-)
    std::string content;

    if (m_path != path) {
        m_path = path;
        try {
            m_ifile.open(m_path.toUtf8().constData(), std::ifstream::in);
            if (!m_ifile.good()) {
                std::cout << "ERROR: " << m_path.toUtf8().constData() << 
                    " is not good" << std::endl;
                emit error();
                return;
            }
            m_ifile >> content;
            m_ifile.close();
            emit finished(QString::fromUtf8(content.c_str()));
        } catch (std::ios_base::failure& e) {
            std::cout << "ERROR: " << __PRETTY_FUNCTION__ << " " << e.what() << 
                std::endl;
            emit error();
        }
    }
}

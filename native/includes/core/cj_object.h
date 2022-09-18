#ifndef __OBJECT_H_
#define __OBJECT_H_
#include <QObject>

class CjObject : public QObject
{
    Q_OBJECT
public:
    CjObject(QObject *parent = nullptr) : QObject(parent) {}
};

#endif
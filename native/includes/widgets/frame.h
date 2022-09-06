#ifndef __FRAME_H_
#define __FRAME_H_
#include <QFrame>
#include <QWidget>
#include "object.h"

class CjFrame : public QFrame
{
    Q_OBJECT
public:
    CjFrame(QWidget *parent = nullptr, Qt::WindowFlags f = Qt::WindowFlags()) : QFrame(parent, f) {}

public:
    void initStyleOptionPublic(QStyleOptionFrame *option) const
    {
        return initStyleOption(option);
    }
};

#endif
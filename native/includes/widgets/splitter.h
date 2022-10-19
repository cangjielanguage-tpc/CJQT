#ifndef __SPLITTER_H_
#define __SPLITTER_H_

#include <QSplitter>
#include "widget.h"

class CjQtSplitter : public QSplitter
{
    Q_OBJECT
public:
    CjQtSplitter(QWidget *parent = nullptr) : QSplitter(parent) {}

protected:
    PAINT_EVENT(QSplitter::paintEvent(event))

    MOUSE_PRESS_EVENT(QSplitter::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QSplitter::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QSplitter::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QSplitter::keyPressEvent(event))
};

#endif
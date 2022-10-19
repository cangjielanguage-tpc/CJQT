#ifndef __SPLITTER_HANDLE_H_
#define __SPLITTER_HANDLE_H_

#include <QSplitterHandle>
#include "widget.h"

class CjQtSplitterHandle : public QSplitterHandle
{
    Q_OBJECT
public:
    CjQtSplitterHandle(Qt::Orientation o = Qt::Horizontal, QSplitter *parent = nullptr) : QSplitterHandle(o, parent) {}

protected:
    PAINT_EVENT(QSplitterHandle::paintEvent(event))

    MOUSE_PRESS_EVENT(QSplitterHandle::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QSplitterHandle::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QSplitterHandle::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QSplitterHandle::keyPressEvent(event))
};

#endif
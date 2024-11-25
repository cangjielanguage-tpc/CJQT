#ifndef __LABEL_H_
#define __LABEL_H_

#include <QGridLayout>
#include "widget.h"

class CjQtGridLayout : public QGridLayout
{
    Q_OBJECT
public:
    CjQtGridLayout(QWidget *parent = nullptr) : QGridLayout(parent) {}

protected:
    // PAINT_EVENT(QGridLayout::paintEvent)

    // MOUSE_PRESS_EVENT(QGridLayout::mousePressEvent)

    // MOUSE_RELEASE_EVENT(QGridLayout::mouseReleaseEvent)

    // MOUSE_MOVE_EVENT(QGridLayout::mouseMoveEvent)

    // KEY_PRESS_EVENT
};

#endif
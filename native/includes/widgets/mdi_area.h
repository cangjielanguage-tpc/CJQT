#ifndef __MDI_AREA_H_
#define __MDI_AREA_H_

#include <QMdiArea>
#include "widget.h"

class CjQtMdiArea : public QMdiArea
{
    Q_OBJECT
public:
    CjQtMdiArea(QWidget *parent = nullptr) : QMdiArea(parent) {}

protected:
//    PAINT_EVENT(QFileDialog::paintEvent(event))

//    MOUSE_PRESS_EVENT(QFileDialog::mousePressEvent(event))

//    MOUSE_RELEASE_EVENT(QFileDialog::mouseReleaseEvent(event))

//    MOUSE_MOVE_EVENT(QFileDialog::mouseMoveEvent(event))

//    KEY_PRESS_EVENT(QFileDialog::keyPressEvent(event))
};

#endif

#ifndef __BASE_WIDGET_H_
#define __BASE_WIDGET_H_

#include <QWidget>

#include "object.h"
#include "data_type.h"

class CjQtWidget : public QWidget
{
    Q_OBJECT
public:
    CjQtWidget(QWidget *parent = nullptr) : QWidget(parent) {}

protected:
    PAINT_EVENT(QWidget::paintEvent(event))

    MOUSE_PRESS_EVENT(QWidget::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QWidget::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QWidget::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QWidget::keyPressEvent(event))
};

#endif
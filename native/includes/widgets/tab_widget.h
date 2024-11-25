#ifndef __TAB_WIDGET_H_
#define __TAB_WIDGET_H_

#include <QTabWidget>
#include "widget.h"

class CjQtTabWidget : public QTabWidget
{
    Q_OBJECT
public:
    CjQtTabWidget(QWidget *parent = nullptr) : QTabWidget(parent) {}

protected:
    PAINT_EVENT(QTabWidget::paintEvent(event))

    MOUSE_PRESS_EVENT(QTabWidget::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QTabWidget::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QTabWidget::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QTabWidget::keyPressEvent(event))
};

#endif
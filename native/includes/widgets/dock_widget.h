#ifndef DOCKWIDGET_H
#define DOCKWIDGET_H

#include <QDockWidget>
#include "widget.h"

class CjQtDockWidget : public QDockWidget
{
    Q_OBJECT
public:
    explicit CjQtDockWidget(QWidget *parent = nullptr): QDockWidget(parent) {}

signals:

};

#endif // DOCKWIDGET_H

#ifndef __TABLE_VIEW_H_
#define __TABLE_VIEW_H_

#include <QTableView>
#include "widget.h"
#include "object.h"

class CjTableView : public QTableView
{
    Q_OBJECT
public:
    CjTableView(QWidget *parent = nullptr) : QTableView(parent) {}

protected:
    PAINT_EVENT(QTableView::paintEvent(event))

    MOUSE_PRESS_EVENT(QTableView::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QTableView::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QTableView::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QTableView::keyPressEvent(event))

    void wheelEvent(QWheelEvent *e){
        QTableView::wheelEvent(e);
    }

    void rowsInserted(const QModelIndex &parent, int start, int end)
    {
        QTableView::rowsInserted(parent, start, end);
    }

    void rowsAboutToBeRemoved(const QModelIndex &parent, int start, int end)
    {
        QTableView::rowsAboutToBeRemoved(parent, start, end);
    }
};

#endif

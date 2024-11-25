#ifndef TREEVIEW_H
#define TREEVIEW_H
#include "widget.h"
#include <QTreeView>
class CjQtTreeView : public QTreeView
{
    Q_OBJECT
public:
    CjQtTreeView(QWidget *parent = nullptr) : QTreeView(parent) {}
};

#endif // TREEVIEW_H

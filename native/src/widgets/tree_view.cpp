#include "tree_view.h"
#include <QTreeView>
#include <QDebug>
extern "C"
{
    // QListView
    uintptr_t nativeTreeViewCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtTreeView *treeView;
        if (parentPtr == 0L)
        {
            treeView = new CjQtTreeView();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            treeView = new CjQtTreeView(parent);
        }
        return reinterpret_cast<uintptr_t>(treeView);
    }
    void nativeTreeViewDelete(uintptr_t ptr){
        QTreeView *tree = reinterpret_cast<QTreeView *>(static_cast<uintptr_t>(ptr));
        delete tree;
    }
    void nativeTreeViewSetHeaderHidden(uintptr_t ptr,bool hide){
//        qDebug()<<"get TreeView begin!!!"<<endl;
//        qDebug()<<hide<<endl;
        QTreeView *tree = reinterpret_cast<QTreeView *>(static_cast<uintptr_t>(ptr));        
//        qDebug()<<"get TreeView ok!!!"<<endl;
        tree->setHeaderHidden(hide);
        qDebug()<<"hide ok!!!"<<endl;
    }

}

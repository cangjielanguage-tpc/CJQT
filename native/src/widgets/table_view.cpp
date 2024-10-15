#include "table_view.h"

extern "C"
{
    // QListView
    uintptr_t nativeTableViewCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjTableView *tableView;
        if (parentPtr == 0L)
        {
            tableView = new CjTableView();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            tableView = new CjTableView(parent);
        }
        return reinterpret_cast<uintptr_t>(tableView);
    }

    
    void nativeTableViewDelete(uintptr_t ptr)
    {
        CjTableView *instance = reinterpret_cast<CjTableView *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }


    uintptr_t nativeTableViewVerticalHeader(uintptr_t ptr) {
        CjTableView *instance = reinterpret_cast<CjTableView *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->verticalHeader());
    }

    uintptr_t nativeTableViewHorizontalHeader(uintptr_t ptr) {
        CjTableView *instance = reinterpret_cast<CjTableView *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->horizontalHeader());
    }

    uintptr_t nativeTableViewCurrentIndex(uintptr_t ptr){
        CjTableView *instance = reinterpret_cast<CjTableView *>(static_cast<uintptr_t>(ptr));
        QModelIndex modelIndex = instance->currentIndex();
        QModelIndex *model = new QModelIndex(modelIndex);
        return reinterpret_cast<uintptr_t>(model);
    }
}

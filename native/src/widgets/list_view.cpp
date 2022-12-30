#include "list_view.h"

extern "C"
{
    // QListView
    long nativeListViewCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjListView *listView;
        if (parentPtr == 0L)
        {
            listView = new CjListView();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            listView = new CjListView(parent);
        }
        return reinterpret_cast<long>(listView);
    }

    
    void nativeListViewDelete(long ptr)
    {
        CjListView *instance = reinterpret_cast<CjListView *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
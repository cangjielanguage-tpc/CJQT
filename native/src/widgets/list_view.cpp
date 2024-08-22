#include "list_view.h"

extern "C"
{
    // QListView
    uintptr_t nativeListViewCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(listView);
    }

    
    void nativeListViewDelete(uintptr_t ptr)
    {
        CjListView *instance = reinterpret_cast<CjListView *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
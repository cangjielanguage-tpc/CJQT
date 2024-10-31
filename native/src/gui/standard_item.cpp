#include <QStandardItem>
#include <QIcon>

extern "C"
{

    uintptr_t nativeStandardItemCreate(){
        QStandardItem *item=new QStandardItem();
        return reinterpret_cast<uintptr_t>(item);

    }
    uintptr_t nativeStandardItemCreateText(const char *text){
        QStandardItem *item=new QStandardItem(text);
        return reinterpret_cast<uintptr_t>(item);

    }
    uintptr_t nativeStandardItemCreateIcon(uintptr_t iconPtr,const char *text){
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        QStandardItem *item=new QStandardItem(*icon,text);
        return reinterpret_cast<uintptr_t>(item);

    }
    uintptr_t nativeStandardItemCreateRC(int rows,int columns){

    }
    void nativeStandardItemDelete(uintptr_t ptr){
        QStandardItem *parent = reinterpret_cast<QStandardItem *>(static_cast<uintptr_t>(ptr));
        delete parent;
    }


    void nativeStandardItemAppendRow(uintptr_t ptr,uintptr_t itemPtr){

        QStandardItem *model = reinterpret_cast<QStandardItem *>(static_cast<uintptr_t>(ptr));
        QStandardItem *item = reinterpret_cast<QStandardItem *>(static_cast<uintptr_t>(itemPtr));
        model->appendRow(item);

    };
}

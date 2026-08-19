/*
 * CJQT native bindings: QListWidget, QTableWidget, QTreeWidget and their item classes
 */
#include <QListWidget>
#include <QTableWidget>
#include <QTreeWidget>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QListWidget ----

    uintptr_t nativeListWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QListWidget(parent));
    }

    void nativeListWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeListWidgetAddItem(uintptr_t ptr, const char *text)
    {
        QListWidgetItem *item = new QListWidgetItem(QString::fromUtf8(text));
        reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->addItem(item);
        return reinterpret_cast<uintptr_t>(item);
    }

    int nativeListWidgetCount(uintptr_t ptr)
    {
        return reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->count();
    }

    uintptr_t nativeListWidgetItem(uintptr_t ptr, int index)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->item(index));
    }

    void nativeListWidgetSetCurrentRow(uintptr_t ptr, int row)
    {
        reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->setCurrentRow(row);
    }

    int nativeListWidgetCurrentRow(uintptr_t ptr)
    {
        return reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->currentRow();
    }

    uintptr_t nativeListWidgetCurrentItem(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->currentItem());
    }

    void nativeListWidgetClear(uintptr_t ptr)
    {
        reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr))->clear();
    }

    void nativeListWidgetSetItemText(uintptr_t ptr, int index, const char *text)
    {
        QListWidget *list = reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr));
        QListWidgetItem *item = list->item(index);
        if (item != nullptr)
        {
            item->setText(QString::fromUtf8(text));
        }
    }

    void nativeListWidgetSetItemWidget(uintptr_t ptr, int index, uintptr_t widgetPtr)
    {
        QListWidget *list = reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr));
        QListWidgetItem *item = list->item(index);
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        if (item != nullptr)
        {
            list->setItemWidget(item, widget);
        }
    }

    uintptr_t nativeListWidgetItemWidget(uintptr_t ptr, int index)
    {
        QListWidget *list = reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr));
        QListWidgetItem *item = list->item(index);
        if (item != nullptr)
        {
            QWidget *widget = list->itemWidget(item);
            return reinterpret_cast<uintptr_t>(widget);
        }
        return 0;
    }

    char *nativeListWidgetItemText(uintptr_t ptr, int index)
    {
        QListWidget *list = reinterpret_cast<QListWidget *>(static_cast<uintptr_t>(ptr));
        QListWidgetItem *item = list->item(index);
        if (item != nullptr)
        {
            return cjqt_to_cstring(item->text());
        }
        return cjqt_to_cstring(QString());
    }

    // ---- QListWidgetItem ----

    uintptr_t nativeListWidgetItemCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QListWidgetItem(QString::fromUtf8(text)));
    }

    void nativeListWidgetItemDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QListWidgetItem *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeListWidgetItemGetText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QListWidgetItem *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeListWidgetItemSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QListWidgetItem *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    // ---- QTableWidget ----

    uintptr_t nativeTableWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QTableWidget(parent));
    }

    void nativeTableWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr));
    }

    int nativeTableWidgetRowCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->rowCount();
    }

    int nativeTableWidgetColumnCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->columnCount();
    }

    void nativeTableWidgetSetRowCount(uintptr_t ptr, int rows)
    {
        reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->setRowCount(rows);
    }

    void nativeTableWidgetSetColumnCount(uintptr_t ptr, int columns)
    {
        reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->setColumnCount(columns);
    }

    void nativeTableWidgetSetItem(uintptr_t ptr, int row, int col, uintptr_t itemPtr)
    {
        QTableWidgetItem *item = reinterpret_cast<QTableWidgetItem *>(static_cast<uintptr_t>(itemPtr));
        reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->setItem(row, col, item);
    }

    uintptr_t nativeTableWidgetItem(uintptr_t ptr, int row, int col)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr))->item(row, col));
    }

    char *nativeTableWidgetItemText(uintptr_t ptr, int row, int col)
    {
        QTableWidget *table = reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr));
        QTableWidgetItem *item = table->item(row, col);
        if (item != nullptr)
        {
            return cjqt_to_cstring(item->text());
        }
        return cjqt_to_cstring(QString());
    }

    void nativeTableWidgetSetItemText(uintptr_t ptr, int row, int col, const char *text)
    {
        QTableWidget *table = reinterpret_cast<QTableWidget *>(static_cast<uintptr_t>(ptr));
        QTableWidgetItem *item = table->item(row, col);
        if (item != nullptr)
        {
            item->setText(QString::fromUtf8(text));
        }
    }

    // ---- QTableWidgetItem ----

    uintptr_t nativeTableWidgetItemCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QTableWidgetItem(QString::fromUtf8(text)));
    }

    void nativeTableWidgetItemDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTableWidgetItem *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTableWidgetItemGetText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTableWidgetItem *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeTableWidgetItemSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTableWidgetItem *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    // ---- QTreeWidget ----

    uintptr_t nativeTreeWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QTreeWidget(parent));
    }

    void nativeTreeWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr));
    }

    int nativeTreeWidgetTopLevelItemCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr))->topLevelItemCount();
    }

    uintptr_t nativeTreeWidgetTopLevelItem(uintptr_t ptr, int index)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr))->topLevelItem(
            index));
    }

    void nativeTreeWidgetAddTopLevelItem(uintptr_t ptr, uintptr_t itemPtr)
    {
        QTreeWidgetItem *item = reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(itemPtr));
        reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr))->addTopLevelItem(item);
    }

    uintptr_t nativeTreeWidgetCurrentItem(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr))->currentItem());
    }

    void nativeTreeWidgetClear(uintptr_t ptr)
    {
        reinterpret_cast<QTreeWidget *>(static_cast<uintptr_t>(ptr))->clear();
    }

    // ---- QTreeWidgetItem ----

    uintptr_t nativeTreeWidgetItemCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QTreeWidgetItem(QStringList(QString::fromUtf8(text))));
    }

    void nativeTreeWidgetItemDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTreeWidgetItemGetText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(ptr))->text(0));
    }

    void nativeTreeWidgetItemSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(ptr))->setText(0, QString::fromUtf8(text));
    }

    void nativeTreeWidgetItemAddChild(uintptr_t ptr, uintptr_t childPtr)
    {
        QTreeWidgetItem *item = reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(ptr));
        QTreeWidgetItem *child = reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(childPtr));
        item->addChild(child);
    }

    int nativeTreeWidgetItemChildCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTreeWidgetItem *>(static_cast<uintptr_t>(ptr))->childCount();
    }
}

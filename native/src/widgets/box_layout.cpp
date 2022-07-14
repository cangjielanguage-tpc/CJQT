#include "box_layout.h"

extern "C" {
    // QBoxLayout

    long nativeBoxLayoutCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtBoxLayout *layout;
        if (parentPtr == 0L)
        {
            layout = new CjQtBoxLayout();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            layout = new CjQtBoxLayout(parent);
        }
        return reinterpret_cast<long>(layout);
    }

    void nativeBoxLayoutAddWidget(long ptr, long widgetPtr)
	{
		QBoxLayout *instance = reinterpret_cast<QBoxLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget);
	}

    void nativeBoxLayoutDelete(long ptr)
    {
        CjQtBoxLayout *instance = reinterpret_cast<CjQtBoxLayout *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
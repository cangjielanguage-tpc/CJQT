#include "box_layout.h"

extern "C" {
    // QBoxLayout

    uintptr_t nativeBoxLayoutCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(layout);
    }

    void nativeBoxLayoutAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
	{
		QBoxLayout *instance = reinterpret_cast<QBoxLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget);
	}

    void nativeBoxLayoutDelete(uintptr_t ptr)
    {
        CjQtBoxLayout *instance = reinterpret_cast<CjQtBoxLayout *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeBoxLayoutAddSpacing(uintptr_t ptr, int spacing)
	{
		QBoxLayout *instance = reinterpret_cast<QBoxLayout *>(static_cast<uintptr_t>(ptr));
		instance->addSpacing(spacing);
	}

    void nativeBoxLayoutAddStretch(uintptr_t ptr, int stretch)
	{
		QBoxLayout *instance = reinterpret_cast<QBoxLayout *>(static_cast<uintptr_t>(ptr));
		instance->addStretch(stretch);
	}

    void nativeBoxLayoutAddLayout(uintptr_t ptr, uintptr_t layoutPtr, int stretch)
	{
		QBoxLayout *instance = reinterpret_cast<QBoxLayout *>(static_cast<uintptr_t>(ptr));
        QLayout *layout = reinterpret_cast<QLayout *>(static_cast<uintptr_t>(layoutPtr));
		instance->addLayout(layout, stretch);
	}
}
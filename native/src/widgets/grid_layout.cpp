#include "grid_layout.h"

extern "C"
{

	// QGridLayout

	long nativeGridLayoutCreate(long appPtr, long parentPtr)
	{

		CjQtGridLayout *layout;
		if (parentPtr == 0L)
		{
			layout = new CjQtGridLayout();
		}
		else
		{
			QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
			layout = new CjQtGridLayout(parent);
		}
		return reinterpret_cast<long>(layout);
	}

	void nativeGridLayoutSetHorizontalSpacing(long ptr, int spacing)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setHorizontalSpacing(spacing);
	}

	void nativeGridLayoutSetVerticalSpacing(long ptr, int spacing)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setVerticalSpacing(spacing);
	}

	void nativeGridLayoutSetAlignment(long ptr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setAlignment(Qt::AlignCenter);
	}

	void nativeGridLayoutAddWidget(long ptr, long widgetPtr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget);
	}

	void nativeGridLayoutAddWidgetWithNum(long ptr, long widgetPtr, int row, int column)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget, row, column);
	}

	void nativeGridLayoutAddWidgetWithNumAndSpan(long ptr, long widgetPtr, int row, int column, int rowSpan, int columnSpan)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget, row, column, rowSpan, columnSpan);
	}

	void nativeGridLayoutDelete(long ptr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}
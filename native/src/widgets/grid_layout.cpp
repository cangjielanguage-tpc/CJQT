#include "grid_layout.h"

extern "C"
{

	// QGridLayout

	uintptr_t nativeGridLayoutCreate(uintptr_t parentPtr)
	{
		APPLICATION_CREATE
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
		return reinterpret_cast<uintptr_t>(layout);
	}

	void nativeGridLayoutSetHorizontalSpacing(uintptr_t ptr, int spacing)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setHorizontalSpacing(spacing);
	}

	void nativeGridLayoutSetVerticalSpacing(uintptr_t ptr, int spacing)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setVerticalSpacing(spacing);
	}

	void nativeGridLayoutSetAlignment(uintptr_t ptr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		instance->setAlignment(Qt::AlignCenter);
	}

	void nativeGridLayoutAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget);
	}

	void nativeGridLayoutAddWidgetWithNum(uintptr_t ptr, uintptr_t widgetPtr, int row, int column)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget, row, column);
	}

	void nativeGridLayoutAddWidgetWithNumAndSpan(uintptr_t ptr, uintptr_t widgetPtr, int row, int column, int rowSpan, int columnSpan)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
		instance->addWidget(widget, row, column, rowSpan, columnSpan);
	}

	void nativeGridLayoutDelete(uintptr_t ptr)
	{
		CjQtGridLayout *instance = reinterpret_cast<CjQtGridLayout *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}
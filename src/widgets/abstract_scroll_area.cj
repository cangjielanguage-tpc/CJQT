package cjqt.widgets

import cjqt.core.*
import cjqt.tools.ScrollBarPolicy

//C
foreign func nativeAbstractScrollAreaCreate(parentPtr: Int64): Int64
foreign func nativeAbstractScrollAreaDelete(ptr: Int64): Unit
foreign func nativeAbstractScrollAreaAddScrollBarWidget(ptr: Int64, widgetPtr: Int64, alignment: Int16): Unit
foreign func nativeAbstractScrollAreaCornerWidget(ptr: Int64): Int64
foreign func nativeAbstractScrollAreaHorizontalScrollBar(ptr: Int64): Int64
foreign func nativeAbstractScrollAreaHorizontalScrollBarPolicy(ptr: Int64): Int32
foreign func nativeAbstractScrollAreaMaximumVieportSize(ptr: Int64): Int64

/******************
   QWidgetList nativeAbstractScrollAreaScrollBarWidgets(ptr:Int64, short alignment)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       return instance->scrollBarWidgets(Qt::Alignment(alignment));
   }
 * ********************/
foreign func nativeAbstractScrollAreaSetCornerWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeAbstractScrollAreaSetHorizontalScrollBar(ptr: Int64, scrollBarPtr: Int64): Unit
foreign func nativeAbstractScrollAreaSetHorizontalScrollBarPolicy(ptr: Int64, policy: Int32): Unit
foreign func nativeAbstractScrollAreaSetSizeAdjustPolicy(ptr: Int64, policy: Int32): Unit
foreign func nativeAbstractScrollAreaSetVerticalScrollBar(ptr: Int64, scrollBarPtr: Int64): Unit
foreign func nativeAbstractScrollAreaSetVerticalScrollBarPolicy(ptr: Int64, policy: Int32): Unit
foreign func nativeAbstractScrollAreaSetViewreport(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeAbstractScrollAreaSetupViewport(ptr: Int64, viewportPtr: Int64): Unit

/*******************
   int nativeAbstractScrollAreaSizeAdjustPolicy(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       return instance->sizeAdjustPolicy();
   }
   uintptr_t nativeAbstractScrollAreaVerticalScrollBar(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       QScrollBar *scrollbar = instance->verticalScrollBar();
       return reinterpret_cast<uintptr_t>(scrollbar);
   }
   int nativeAbstractScrollAreaVerticalScrollBarPolicy(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       return instance->verticalScrollBarPolicy();
   }
   uintptr_t nativeAbstractScrollAreaViewport(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       QWidget *widget = instance->viewport();
       return reinterpret_cast<uintptr_t>(widget);
   }
   uintptr_t nativeAbstractScrollAreaMinimumSizeHint(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       QSize size = instance->minimumSizeHint();
       return reinterpret_cast<uintptr_t>(&size);
   }
   uintptr_t nativeAbstractScrollAreaSizeHint(ptr:Int64)
   {
       QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
       QSize size = instance->sizeHint();
       return reinterpret_cast<uintptr_t>(&size);
   }
 * *****************/
public open class QAbstractScrollArea <: QFrame {
    public init() {
        super(
            unsafe {
                nativeAbstractScrollAreaCreate(0)
            }
        )
    }
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeAbstractScrollAreaCreate(parent.ptr)
            }
        )
    }
    public open override func delete(): Unit {
        return unsafe {
            nativeAbstractScrollAreaDelete(this.ptr)
        }
    }

    public func addScrollBarWidget(widget: QWidget, alignment: Alignment): Unit {
        return unsafe {
            nativeAbstractScrollAreaAddScrollBarWidget(this.ptr, widget.ptr, alignment.value())
        }
    }

    public func setHorizontalScrollBarPolicy(policy: ScrollBarPolicy): Unit {
        return unsafe {
            nativeAbstractScrollAreaSetHorizontalScrollBarPolicy(this.ptr, policy.value())
        }
    }

    public func setVerticalScrollBarPolicy(policy: ScrollBarPolicy): Unit {
        return unsafe {
            nativeAbstractScrollAreaSetVerticalScrollBarPolicy(this.ptr, policy.value())
        }
    }


    public func cornerWidget(): QWidget {
        let widgetPtr = unsafe {
            nativeAbstractScrollAreaCornerWidget(this.ptr)
        }
        return QWidget(widgetPtr)
    }
}
//foreign func nativeAbstractScrollAreaHorizontalScrollBar(ptr: Int64): Int64
//foreign func nativeAbstractScrollAreaHorizontalScrollBarPolicy(ptr: Int64): Int32
//foreign func nativeAbstractScrollAreaMaximumVieportSize(ptr: Int64): Int64

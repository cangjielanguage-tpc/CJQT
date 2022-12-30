/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativeSplitterCreate(parentPtr: Int64): Int64
foreign func nativeSplitterDelete(ptr: Int64): Unit

foreign func nativeSplitterAddWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeSplitterInsertWidget(ptr: Int64, index: Int32, widgetPtr: Int64): Unit
foreign func nativeSplitterReplaceWidget(ptr: Int64, index: Int32, widgetPtr: Int64): Unit

foreign func nativeSplitterSetOrientation(ptr: Int64, orientation: Int32): Unit
foreign func nativeSplitterOrientation(ptr: Int64): Int32

foreign func nativeSplitterSetChildrenCollapsible(ptr: Int64, collapsible: Bool): Unit
foreign func nativeSplitterChildrenCollapsible(ptr: Int64): Bool
foreign func nativeSplitterSetCollapsible(ptr: Int64, index: Int32, collapsible: Bool): Unit
foreign func nativeSplitterCollapsible(ptr: Int64, index: Int32): Bool
foreign func nativeSplitterSetOpaqueResize(ptr: Int64, resize: Bool): Unit
foreign func nativeSplitterOpaqueResize(ptr: Int64): Bool
foreign func nativeSplitterRefresh(ptr: Int64): Unit
foreign func nativeSplitterSizeHint(ptr: Int64): Int64
foreign func nativeSplitterMinimumSizeHint(ptr: Int64): Int64

foreign func nativeSplitterSetHandleWidth(ptr: Int64, width: Int32): Unit
foreign func nativeSplitterHandleWidth(ptr: Int64): Int32

foreign func nativeSplitterIndexOf(ptr: Int64, widgetPtr: Int64): Int32
foreign func nativeSplitterWidget(ptr: Int64, index: Int32): Int64
foreign func nativeSplitterCount(ptr: Int64): Int32

foreign func nativeSplitterHandle(ptr: Int64, index: Int32): Int64
foreign func nativeSplitterSetStretchFactor(ptr: Int64, index: Int32, stretch: Int32): Unit

public class QSplitter <: QWidget {
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeSplitterCreate(parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeSplitterDelete(ptr)
        }
    }

    public func addWidget(widget: QWidget) {
        unsafe {
            nativeSplitterAddWidget(ptr, widget.ptr)
        }
    }

    public func insertWidget(index: Int32, widget: QWidget) {
        unsafe {
            nativeSplitterInsertWidget(ptr, Int32(index), widget.ptr)
        }
    }

    public func replaceWidget(index: Int32, widget: QWidget) {
        unsafe {
            nativeSplitterReplaceWidget(ptr, Int32(index), widget.ptr)
        }
    }

    public func setOrientation(orientation: Int64) {
        unsafe {
            nativeSplitterSetOrientation(ptr, Int32(orientation))
        }
    }

    public func orientation(): Int64 {
        let result = unsafe {
            nativeSplitterOrientation(ptr)
        }
        return Int64(result)
    }

    public func setChildrenCollapsible(collapsible: Bool) {
        unsafe {
            nativeSplitterSetChildrenCollapsible(ptr, collapsible)
        }
    }

    public func childrenCollapsible(): Bool {
        let result = unsafe {
            nativeSplitterChildrenCollapsible(ptr)
        }
        return result
    }

    public func setCollapsible(index: Int64, collapsible: Bool) {
        unsafe {
            nativeSplitterSetCollapsible(ptr, Int32(index), collapsible)
        }
    }

    public func isCollapsible(index: Int64): Bool {
        let result = unsafe {
            nativeSplitterCollapsible(ptr, Int32(index))
        }
        return result
    }

    public func setOpaqueResize(resize: Bool) {
        unsafe {
            nativeSplitterSetOpaqueResize(ptr, resize)
        }
    }

    public func opaqueResize(): Bool {
        let result = unsafe {
            nativeSplitterOpaqueResize(ptr)
        }
        return result
    }

    public func refresh() {
        unsafe {
            nativeSplitterRefresh(ptr)
        }
    }

    public func sizeHint(): QSize {
        let result = unsafe {
            nativeSplitterSizeHint(ptr)
        }
        return QSize(result)
    }

    public func minimumSizeHint(): QSize {
        let result = unsafe {
            nativeSplitterMinimumSizeHint(ptr)
        }
        return QSize(result)
    }

    public func setHandleWidth(width: Int64) {
        unsafe {
            nativeSplitterSetHandleWidth(ptr, Int32(width))
        }
    }

    public func handleWidth(): Int64 {
        let result = unsafe {
            nativeSplitterHandleWidth(ptr)
        }
        return Int64(result)
    }

    public func indexOf(widget: QWidget): Int64 {
        let result = unsafe {
            nativeSplitterIndexOf(ptr, widget.ptr)
        }
        return Int64(result)
    }

    public func widget(index: Int64): QWidget {
        let result = unsafe {
            nativeSplitterWidget(ptr, Int32(index))
        }
        return QWidget(result)
    }

    public func count(): Int64 {
        let result = unsafe {
            nativeSplitterCount(ptr)
        }
        return Int64(result)
    }

    public func handle(index: Int64): QSplitterHandle {
        let result = unsafe {
            nativeSplitterHandle(ptr, Int32(index))
        }
        return QSplitterHandle(result)
    }

    public func setStretchFactor(index: Int64, stretch: Int64) {
        unsafe {
            nativeSplitterSetStretchFactor(ptr, Int32(index), Int32(stretch))
        }
    }
}

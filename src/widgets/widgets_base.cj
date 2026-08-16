package cjqt.widgets

import cjqt.gui.*

foreign func nativeAbstractSpinBoxCreate(parentPtr: Int64): Int64
foreign func nativeAbstractSpinBoxDelete(ptr: Int64): Unit
foreign func nativeAbstractSpinBoxText(ptr: Int64): CString
foreign func nativeMdiSubWindowCreate(parentPtr: Int64): Int64
foreign func nativeMdiSubWindowDelete(ptr: Int64): Unit
foreign func nativeMdiSubWindowSetWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeMdiSubWindowWidget(ptr: Int64): Int64
foreign func nativeColumnViewCreate(parentPtr: Int64): Int64
foreign func nativeColumnViewDelete(ptr: Int64): Unit
foreign func nativeItemEditorFactoryCreate(): Int64
foreign func nativeItemEditorFactoryDelete(ptr: Int64): Unit
foreign func nativeFileIconProviderCreate(): Int64
foreign func nativeFileIconProviderDelete(ptr: Int64): Unit
foreign func nativeFileIconProviderIcon(ptr: Int64, path: CString): Int64

public class QAbstractSpinBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeAbstractSpinBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeAbstractSpinBoxDelete(ptr)
        }
    }

    public func text(): String {
        return unsafe { nativeAbstractSpinBoxText(ptr).toString() }
    }
}

public class QMdiSubWindow <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeMdiSubWindowCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeMdiSubWindowDelete(ptr)
        }
    }

    public func setWidget(widget: QWidget) {
        unsafe { nativeMdiSubWindowSetWidget(ptr, widget.ptr) }
    }

    public func widget(): QWidget {
        return QWidget(unsafe { nativeMdiSubWindowWidget(ptr) })
    }
}

public class QColumnView <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeColumnViewCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeColumnViewDelete(ptr)
        }
    }
}

public class QItemEditorFactory {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeItemEditorFactoryCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeItemEditorFactoryDelete(ptr) }
    }
}

public class QFileIconProvider {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeFileIconProviderCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeFileIconProviderDelete(ptr) }
    }

    public func icon(path: String): QIcon {
        return QIcon(unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileIconProviderIcon(ptr, p)
            LibC.free(p)
            r
        })
    }
}

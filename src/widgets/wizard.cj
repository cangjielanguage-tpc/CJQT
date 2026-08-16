package cjqt.widgets

foreign func nativeWizardCreate(parentPtr: Int64): Int64
foreign func nativeWizardDelete(ptr: Int64): Unit
foreign func nativeWizardAddPage(ptr: Int64, pagePtr: Int64): Int32
foreign func nativeWizardPageCount(ptr: Int64): Int32
foreign func nativeWizardCurrentId(ptr: Int64): Int32
foreign func nativeWizardSetStartId(ptr: Int64, id: Int32): Unit
foreign func nativeWizardPageCreate(parentPtr: Int64): Int64
foreign func nativeWizardPageDelete(ptr: Int64): Unit
foreign func nativeWizardPageSetTitle(ptr: Int64, title: CString): Unit
foreign func nativeWizardPageTitle(ptr: Int64): CString

public class QWizardPage <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeWizardPageCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeWizardPageDelete(ptr)
        }
    }

    public func setTitle(title: String) {
        unsafe {
            let t = LibC.mallocCString(title)
            nativeWizardPageSetTitle(ptr, t)
            LibC.free(t)
        }
    }

    public func title(): String {
        return unsafe { nativeWizardPageTitle(ptr).toString() }
    }
}

public class QWizard <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeWizardCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeWizardDelete(ptr)
        }
    }

    public func addPage(page: QWizardPage): Int64 {
        return Int64(unsafe { nativeWizardAddPage(ptr, page.ptr) })
    }

    public func pageCount(): Int64 {
        return Int64(unsafe { nativeWizardPageCount(ptr) })
    }

    public func currentId(): Int64 {
        return Int64(unsafe { nativeWizardCurrentId(ptr) })
    }

    public func setStartId(id: Int64) {
        unsafe { nativeWizardSetStartId(ptr, Int32(id)) }
    }
}

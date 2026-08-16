package cjqt.widgets

foreign func nativeCommandLinkButtonCreate(text: CString, parentPtr: Int64): Int64
foreign func nativeCommandLinkButtonDelete(ptr: Int64): Unit
foreign func nativeCommandLinkButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativeCommandLinkButtonText(ptr: Int64): CString
foreign func nativeCommandLinkButtonSetDescription(ptr: Int64, description: CString): Unit
foreign func nativeCommandLinkButtonDescription(ptr: Int64): CString

public class QCommandLinkButton <: QWidget {
    public init(text!: String = "", parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                let t = LibC.mallocCString(text)
                let r = nativeCommandLinkButtonCreate(t, parent.ptr)
                LibC.free(t)
                r
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeCommandLinkButtonDelete(ptr)
        }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeCommandLinkButtonSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func text(): String {
        return unsafe { nativeCommandLinkButtonText(ptr).toString() }
    }

    public func setDescription(description: String) {
        unsafe {
            let d = LibC.mallocCString(description)
            nativeCommandLinkButtonSetDescription(ptr, d)
            LibC.free(d)
        }
    }

    public func description(): String {
        return unsafe { nativeCommandLinkButtonDescription(ptr).toString() }
    }
}

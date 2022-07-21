package qt.gui

foreign func nativeIconCreate(): Int64
foreign func nativeIconCreateWithFileName(fileName: CString): Int64
foreign func nativeIconCreateWithOtherIcon(ptr: Int64): Int64
foreign func nativeIconGetName(ptr: Int64): CString
foreign func nativeIconIsNull(ptr: Int64): Bool
foreign func nativeIconIsMask(ptr: Int64): Bool
foreign func nativeIconIsDetached(ptr: Int64): Bool
foreign func nativeIconDetach(ptr: Int64): Unit
foreign func nativeIconDelete(ptr: Int64): Unit

public class QIcon {
    public let ptr: Int64

    public init() {
        ptr = unsafe {
            nativeIconCreate()
        }
    }

    public init(fileName: String) {
        ptr = unsafe {
            nativeIconCreateWithFileName(CString(fileName))
        }
    }

    public init(icon: QIcon) {
        ptr = unsafe {
            nativeIconCreateWithOtherIcon(icon.ptr)
        }
    }

    public func name(): String {
        let result = unsafe {
            nativeIconGetName(ptr)
        }
        return result.toString()
    }

    public func isNull(): Bool {
        let result = unsafe {
            nativeIconIsNull(ptr)
        }
        return result
    }

    public func isMask(): Bool {
        let result = unsafe {
            nativeIconIsMask(ptr)
        }
        return result
    }

    public func isDetached(): Bool {
        let result = unsafe {
            nativeIconIsDetached(ptr)
        }
        return result
    }

    public func detach() {
        unsafe {
            nativeIconDetach(ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeColorDelete(ptr)
        }
    }
}
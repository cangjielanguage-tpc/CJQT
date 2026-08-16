package cjqt.core

foreign func nativeTimeZoneCreate(zoneId: CString): Int64
foreign func nativeTimeZoneSystem(): Int64
foreign func nativeTimeZoneDelete(ptr: Int64): Unit
foreign func nativeTimeZoneIsValid(ptr: Int64): Bool
foreign func nativeTimeZoneId(ptr: Int64): CString

public class QTimeZone {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(zoneId: String) {
        this.ptr = unsafe {
            let z = LibC.mallocCString(zoneId)
            let r = nativeTimeZoneCreate(z)
            LibC.free(z)
            r
        }
    }

    public static func systemTimeZone(): QTimeZone {
        return QTimeZone(unsafe { nativeTimeZoneSystem() })
    }

    public func delete(): Unit {
        unsafe { nativeTimeZoneDelete(ptr) }
    }

    public func isValid(): Bool {
        return unsafe { nativeTimeZoneIsValid(ptr) }
    }

    public func id(): String {
        return unsafe { nativeTimeZoneId(ptr).toString() }
    }
}

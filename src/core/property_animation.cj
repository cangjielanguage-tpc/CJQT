package cjqt.core

foreign func nativePropertyAnimationCreate(targetPtr: Int64, propertyName: CString, parentPtr: Int64): Int64
foreign func nativePropertyAnimationDelete(ptr: Int64): Unit
foreign func nativePropertyAnimationSetDuration(ptr: Int64, duration: Int32): Unit
foreign func nativePropertyAnimationDuration(ptr: Int64): Int32
foreign func nativePropertyAnimationSetStartValue(ptr: Int64, value: Int32): Unit
foreign func nativePropertyAnimationSetEndValue(ptr: Int64, value: Int32): Unit
foreign func nativePropertyAnimationStart(ptr: Int64): Unit
foreign func nativePropertyAnimationStop(ptr: Int64): Unit

public class QPropertyAnimation <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(targetPtr: Int64, propertyName: String) {
        super(unsafe {
            let p = LibC.mallocCString(propertyName)
            let r = nativePropertyAnimationCreate(targetPtr, p, 0)
            LibC.free(p)
            r
        })
    }

    public override func delete() {
        unsafe { nativePropertyAnimationDelete(ptr) }
    }

    public func setDuration(duration: Int64) {
        unsafe { nativePropertyAnimationSetDuration(ptr, Int32(duration)) }
    }

    public func duration(): Int64 {
        return Int64(unsafe { nativePropertyAnimationDuration(ptr) })
    }

    public func setStartValue(value: Int64) {
        unsafe { nativePropertyAnimationSetStartValue(ptr, Int32(value)) }
    }

    public func setEndValue(value: Int64) {
        unsafe { nativePropertyAnimationSetEndValue(ptr, Int32(value)) }
    }

    public func start() {
        unsafe { nativePropertyAnimationStart(ptr) }
    }

    public func stop() {
        unsafe { nativePropertyAnimationStop(ptr) }
    }
}

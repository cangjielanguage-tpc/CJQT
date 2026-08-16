package cjqt.core

foreign func nativeVariantAnimationCreate(parentPtr: Int64): Int64
foreign func nativeVariantAnimationDelete(ptr: Int64): Unit
foreign func nativeVariantAnimationSetDuration(ptr: Int64, duration: Int32): Unit
foreign func nativeVariantAnimationDuration(ptr: Int64): Int32
foreign func nativeVariantAnimationStart(ptr: Int64): Unit
foreign func nativeVariantAnimationStop(ptr: Int64): Unit
foreign func nativeVariantAnimationCurrentTime(ptr: Int64): Int32

public class QVariantAnimation <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeVariantAnimationCreate(0) })
    }

    public override func delete() {
        unsafe { nativeVariantAnimationDelete(ptr) }
    }

    public func setDuration(duration: Int64) {
        unsafe { nativeVariantAnimationSetDuration(ptr, Int32(duration)) }
    }

    public func duration(): Int64 {
        return Int64(unsafe { nativeVariantAnimationDuration(ptr) })
    }

    public func start() {
        unsafe { nativeVariantAnimationStart(ptr) }
    }

    public func stop() {
        unsafe { nativeVariantAnimationStop(ptr) }
    }

    public func currentTime(): Int64 {
        return Int64(unsafe { nativeVariantAnimationCurrentTime(ptr) })
    }
}

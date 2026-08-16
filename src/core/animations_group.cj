package cjqt.core

foreign func nativeAbstractAnimationStart(ptr: Int64): Unit
foreign func nativeAbstractAnimationStop(ptr: Int64): Unit
foreign func nativeAbstractAnimationState(ptr: Int64): Int32
foreign func nativeAbstractAnimationCurrentTime(ptr: Int64): Int32
foreign func nativeAbstractAnimationDuration(ptr: Int64): Int32
foreign func nativeAnimationGroupDelete(ptr: Int64): Unit
foreign func nativeAnimationGroupAddAnimation(ptr: Int64, animationPtr: Int64): Unit
foreign func nativeAnimationGroupAnimationCount(ptr: Int64): Int32
foreign func nativeAnimationGroupRemoveAnimation(ptr: Int64, animationPtr: Int64): Unit
foreign func nativeAnimationGroupClear(ptr: Int64): Unit
foreign func nativeSequentialAnimationGroupCreate(parentPtr: Int64): Int64
foreign func nativeSequentialAnimationGroupDelete(ptr: Int64): Unit
foreign func nativeParallelAnimationGroupCreate(parentPtr: Int64): Int64
foreign func nativeParallelAnimationGroupDelete(ptr: Int64): Unit
foreign func nativePauseAnimationCreate(duration: Int32, parentPtr: Int64): Int64
foreign func nativePauseAnimationDelete(ptr: Int64): Unit
foreign func nativePauseAnimationSetDuration(ptr: Int64, duration: Int32): Unit

public enum QAbstractAnimationState {
    | Stopped
    | Paused
    | Running

    public func value(): Int32 {
        return match (this) {
            case Stopped => 0
            case Paused => 1
            case Running => 2
        }
    }
}

public open class QAbstractAnimation <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public func start() {
        unsafe { nativeAbstractAnimationStart(ptr) }
    }

    public func stop() {
        unsafe { nativeAbstractAnimationStop(ptr) }
    }

    public func state(): QAbstractAnimationState {
        let s = unsafe { nativeAbstractAnimationState(ptr) }
        return match (s) {
            case 0 => QAbstractAnimationState.Stopped
            case 1 => QAbstractAnimationState.Paused
            case _ => QAbstractAnimationState.Running
        }
    }

    public func currentTime(): Int64 {
        return Int64(unsafe { nativeAbstractAnimationCurrentTime(ptr) })
    }

    public func animationDuration(): Int64 {
        return Int64(unsafe { nativeAbstractAnimationDuration(ptr) })
    }
}

public open class QAnimationGroup <: QAbstractAnimation {
    public init(ptr: Int64) {
        super(ptr)
    }

    public open override func delete() {
        unsafe { nativeAnimationGroupDelete(ptr) }
    }

    public func addAnimation(animation: QAbstractAnimation) {
        unsafe { nativeAnimationGroupAddAnimation(ptr, animation.ptr) }
    }

    public func animationCount(): Int64 {
        return Int64(unsafe { nativeAnimationGroupAnimationCount(ptr) })
    }

    public func removeAnimation(animation: QAbstractAnimation) {
        unsafe { nativeAnimationGroupRemoveAnimation(ptr, animation.ptr) }
    }

    public func clear() {
        unsafe { nativeAnimationGroupClear(ptr) }
    }
}

public class QSequentialAnimationGroup <: QAnimationGroup {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeSequentialAnimationGroupCreate(0) })
    }

    public override func delete() {
        unsafe { nativeSequentialAnimationGroupDelete(ptr) }
    }
}

public class QParallelAnimationGroup <: QAnimationGroup {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeParallelAnimationGroupCreate(0) })
    }

    public override func delete() {
        unsafe { nativeParallelAnimationGroupDelete(ptr) }
    }
}

public class QPauseAnimation <: QAbstractAnimation {
    public init(ptr: Int64) {
        super(ptr)
    }

    public static func withDuration(duration: Int64): QPauseAnimation {
        return QPauseAnimation(unsafe { nativePauseAnimationCreate(Int32(duration), 0) })
    }

    public override func delete() {
        unsafe { nativePauseAnimationDelete(ptr) }
    }

    public func setDuration(duration: Int64) {
        unsafe { nativePauseAnimationSetDuration(ptr, Int32(duration)) }
    }
}

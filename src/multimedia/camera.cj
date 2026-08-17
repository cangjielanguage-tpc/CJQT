package cjqt.multimedia

import cjqt.core.*

foreign func nativeCameraInfoDefault(): Int64
foreign func nativeCameraInfoDelete(ptr: Int64): Unit
foreign func nativeCameraInfoDeviceName(ptr: Int64): CString
foreign func nativeCameraInfoDescription(ptr: Int64): CString
foreign func nativeCameraInfoIsNull(ptr: Int64): Bool
foreign func nativeCameraInfoPosition(ptr: Int64): Int32
foreign func nativeCameraCreate(infoPtr: Int64, parentPtr: Int64): Int64
foreign func nativeCameraDelete(ptr: Int64): Unit
foreign func nativeCameraStart(ptr: Int64): Unit
foreign func nativeCameraStop(ptr: Int64): Unit
foreign func nativeCameraState(ptr: Int64): Int32
foreign func nativeCameraIsAvailable(ptr: Int64): Bool
foreign func nativeCameraSetCaptureMode(ptr: Int64, mode: Int32): Unit
foreign func nativeCameraCaptureMode(ptr: Int64): Int32
foreign func nativeCameraStatus(ptr: Int64): Int32

public enum QCameraState {
    | UnloadedState
    | LoadedState
    | LoadingState
    | UnloadingState
    | ActiveState

    public func value(): Int32 {
        return match (this) {
            case UnloadedState => 0
            case LoadedState => 1
            case LoadingState => 2
            case UnloadingState => 3
            case ActiveState => 4
        }
    }
}

public enum QCameraCaptureMode {
    | CaptureViewfinder
    | CaptureStillImage
    | CaptureVideo

    public func value(): Int32 {
        return match (this) {
            case CaptureViewfinder => 0
            case CaptureStillImage => 1
            case CaptureVideo => 2
        }
    }
}

public class QCameraInfo {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public static func defaultCamera(): QCameraInfo {
        return QCameraInfo(unsafe { nativeCameraInfoDefault() })
    }

    public func delete(): Unit {
        unsafe { nativeCameraInfoDelete(ptr) }
    }

    public func deviceName(): String {
        return unsafe { nativeCameraInfoDeviceName(ptr).toString() }
    }

    public func description(): String {
        return unsafe { nativeCameraInfoDescription(ptr).toString() }
    }

    public func isNull(): Bool {
        return unsafe { nativeCameraInfoIsNull(ptr) }
    }

    public func position(): Int64 {
        return Int64(unsafe { nativeCameraInfoPosition(ptr) })
    }
}

public class QCamera <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(info: QCameraInfo) {
        super(unsafe { nativeCameraCreate(info.ptr, 0) })
    }

    public override func delete() {
        unsafe { nativeCameraDelete(ptr) }
    }

    public func start() {
        unsafe { nativeCameraStart(ptr) }
    }

    public func stop() {
        unsafe { nativeCameraStop(ptr) }
    }

    public func state(): Int64 {
        return Int64(unsafe { nativeCameraState(ptr) })
    }

    public func isAvailable(): Bool {
        return unsafe { nativeCameraIsAvailable(ptr) }
    }

    public func setCaptureMode(mode: QCameraCaptureMode) {
        unsafe { nativeCameraSetCaptureMode(ptr, mode.value()) }
    }

    public func captureMode(): Int64 {
        return Int64(unsafe { nativeCameraCaptureMode(ptr) })
    }

    public func status(): Int64 {
        return Int64(unsafe { nativeCameraStatus(ptr) })
    }
}

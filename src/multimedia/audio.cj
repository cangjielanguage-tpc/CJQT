package cjqt.multimedia

import cjqt.core.*

foreign func nativeAudioFormatCreate(): Int64
foreign func nativeAudioFormatDelete(ptr: Int64): Unit
foreign func nativeAudioFormatSetSampleRate(ptr: Int64, rate: Int32): Unit
foreign func nativeAudioFormatSampleRate(ptr: Int64): Int32
foreign func nativeAudioFormatSetChannelCount(ptr: Int64, count: Int32): Unit
foreign func nativeAudioFormatChannelCount(ptr: Int64): Int32
foreign func nativeAudioFormatSetSampleSize(ptr: Int64, size: Int32): Unit
foreign func nativeAudioFormatSampleSize(ptr: Int64): Int32
foreign func nativeAudioFormatIsValid(ptr: Int64): Bool
foreign func nativeAudioDeviceInfoDefaultInput(): Int64
foreign func nativeAudioDeviceInfoDefaultOutput(): Int64
foreign func nativeAudioDeviceInfoDelete(ptr: Int64): Unit
foreign func nativeAudioDeviceInfoDeviceName(ptr: Int64): CString
foreign func nativeAudioDeviceInfoIsNull(ptr: Int64): Bool
foreign func nativeAudioDeviceInfoIsFormatSupported(ptr: Int64, formatPtr: Int64): Bool
foreign func nativeAudioInputCreate(devicePtr: Int64, formatPtr: Int64, parentPtr: Int64): Int64
foreign func nativeAudioInputDelete(ptr: Int64): Unit
foreign func nativeAudioInputStart(ptr: Int64): Unit
foreign func nativeAudioInputStop(ptr: Int64): Unit
foreign func nativeAudioInputState(ptr: Int64): Int32
foreign func nativeAudioInputSetVolume(ptr: Int64, volume: Float64): Unit
foreign func nativeAudioInputVolume(ptr: Int64): Float64
foreign func nativeAudioOutputCreate(devicePtr: Int64, formatPtr: Int64, parentPtr: Int64): Int64
foreign func nativeAudioOutputDelete(ptr: Int64): Unit
foreign func nativeAudioOutputStart(ptr: Int64): Unit
foreign func nativeAudioOutputStop(ptr: Int64): Unit
foreign func nativeAudioOutputState(ptr: Int64): Int32
foreign func nativeAudioOutputSetVolume(ptr: Int64, volume: Float64): Unit
foreign func nativeAudioOutputVolume(ptr: Int64): Float64
foreign func nativeSoundCreate(path: CString, parentPtr: Int64): Int64
foreign func nativeSoundDelete(ptr: Int64): Unit
foreign func nativeSoundPlay(ptr: Int64): Unit
foreign func nativeSoundStop(ptr: Int64): Unit
foreign func nativeSoundSetLoops(ptr: Int64, loops: Int32): Unit
foreign func nativeSoundLoops(ptr: Int64): Int32
foreign func nativeSoundIsFinished(ptr: Int64): Bool
foreign func nativeSoundPlayWav(path: CString): Unit

public class QAudioFormat {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeAudioFormatCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeAudioFormatDelete(ptr) }
    }

    public func setSampleRate(rate: Int64) {
        unsafe { nativeAudioFormatSetSampleRate(ptr, Int32(rate)) }
    }

    public func sampleRate(): Int64 {
        return Int64(unsafe { nativeAudioFormatSampleRate(ptr) })
    }

    public func setChannelCount(count: Int64) {
        unsafe { nativeAudioFormatSetChannelCount(ptr, Int32(count)) }
    }

    public func channelCount(): Int64 {
        return Int64(unsafe { nativeAudioFormatChannelCount(ptr) })
    }

    public func setSampleSize(size: Int64) {
        unsafe { nativeAudioFormatSetSampleSize(ptr, Int32(size)) }
    }

    public func sampleSize(): Int64 {
        return Int64(unsafe { nativeAudioFormatSampleSize(ptr) })
    }

    public func isValid(): Bool {
        return unsafe { nativeAudioFormatIsValid(ptr) }
    }
}

public class QAudioDeviceInfo {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public static func defaultInputDevice(): QAudioDeviceInfo {
        return QAudioDeviceInfo(unsafe { nativeAudioDeviceInfoDefaultInput() })
    }

    public static func defaultOutputDevice(): QAudioDeviceInfo {
        return QAudioDeviceInfo(unsafe { nativeAudioDeviceInfoDefaultOutput() })
    }

    public func delete(): Unit {
        unsafe { nativeAudioDeviceInfoDelete(ptr) }
    }

    public func deviceName(): String {
        return unsafe { nativeAudioDeviceInfoDeviceName(ptr).toString() }
    }

    public func isNull(): Bool {
        return unsafe { nativeAudioDeviceInfoIsNull(ptr) }
    }

    public func isFormatSupported(format: QAudioFormat): Bool {
        return unsafe { nativeAudioDeviceInfoIsFormatSupported(ptr, format.ptr) }
    }
}

public class QAudioInput {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(deviceInfo: QAudioDeviceInfo, format: QAudioFormat) {
        this.ptr = unsafe { nativeAudioInputCreate(deviceInfo.ptr, format.ptr, 0) }
    }

    public func delete(): Unit {
        unsafe { nativeAudioInputDelete(ptr) }
    }

    public func start() {
        unsafe { nativeAudioInputStart(ptr) }
    }

    public func stop() {
        unsafe { nativeAudioInputStop(ptr) }
    }

    public func state(): Int64 {
        return Int64(unsafe { nativeAudioInputState(ptr) })
    }

    public func setVolume(volume: Float64) {
        unsafe { nativeAudioInputSetVolume(ptr, volume) }
    }

    public func volume(): Float64 {
        return unsafe { nativeAudioInputVolume(ptr) }
    }
}

public class QAudioOutput {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(deviceInfo: QAudioDeviceInfo, format: QAudioFormat) {
        this.ptr = unsafe { nativeAudioOutputCreate(deviceInfo.ptr, format.ptr, 0) }
    }

    public func delete(): Unit {
        unsafe { nativeAudioOutputDelete(ptr) }
    }

    public func start() {
        unsafe { nativeAudioOutputStart(ptr) }
    }

    public func stop() {
        unsafe { nativeAudioOutputStop(ptr) }
    }

    public func state(): Int64 {
        return Int64(unsafe { nativeAudioOutputState(ptr) })
    }

    public func setVolume(volume: Float64) {
        unsafe { nativeAudioOutputSetVolume(ptr, volume) }
    }

    public func volume(): Float64 {
        return unsafe { nativeAudioOutputVolume(ptr) }
    }
}

public class QSound <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(path: String) {
        super(unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeSoundCreate(p, 0)
            LibC.free(p)
            r
        })
    }

    public override func delete() {
        unsafe { nativeSoundDelete(ptr) }
    }

    public func play() {
        unsafe { nativeSoundPlay(ptr) }
    }

    public func stop() {
        unsafe { nativeSoundStop(ptr) }
    }

    public func setLoops(loops: Int64) {
        unsafe { nativeSoundSetLoops(ptr, Int32(loops)) }
    }

    public func loops(): Int64 {
        return Int64(unsafe { nativeSoundLoops(ptr) })
    }

    public func isFinished(): Bool {
        return unsafe { nativeSoundIsFinished(ptr) }
    }

    public static func playWav(path: String) {
        unsafe {
            let p = LibC.mallocCString(path)
            nativeSoundPlayWav(p)
            LibC.free(p)
        }
    }
}

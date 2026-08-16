package cjqt.core

foreign func nativeProcessCreate(parentPtr: Int64): Int64
foreign func nativeProcessDelete(ptr: Int64): Unit
foreign func nativeProcessStart(ptr: Int64, program: CString, argsPtr: Int64): Unit
foreign func nativeProcessWaitForStarted(ptr: Int64, msecs: Int32): Bool
foreign func nativeProcessWaitForFinished(ptr: Int64, msecs: Int32): Bool
foreign func nativeProcessReadAllStandardOutput(ptr: Int64): CString
foreign func nativeProcessReadAllStandardError(ptr: Int64): CString
foreign func nativeProcessWrite(ptr: Int64, data: CString): Unit
foreign func nativeProcessKill(ptr: Int64): Unit
foreign func nativeProcessTerminate(ptr: Int64): Unit
foreign func nativeProcessExitCode(ptr: Int64): Int32
foreign func nativeProcessState(ptr: Int64): Int32

public enum QProcessState {
    | NotRunning
    | Starting
    | Running

    public func value(): Int32 {
        return match (this) {
            case NotRunning => 0
            case Starting => 1
            case Running => 2
        }
    }
}

public class QProcess {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeProcessCreate(0)
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeProcessDelete(ptr)
        }
    }

    public func start(program: String, args!: QStringList = QStringList()) {
        unsafe {
            let p = LibC.mallocCString(program)
            nativeProcessStart(ptr, p, args.ptr)
            LibC.free(p)
        }
    }

    public func waitForStarted(msecs: Int64): Bool {
        return unsafe {
            nativeProcessWaitForStarted(ptr, Int32(msecs))
        }
    }

    public func waitForFinished(msecs: Int64): Bool {
        return unsafe {
            nativeProcessWaitForFinished(ptr, Int32(msecs))
        }
    }

    public func readAllStandardOutput(): String {
        return unsafe {
            nativeProcessReadAllStandardOutput(ptr).toString()
        }
    }

    public func readAllStandardError(): String {
        return unsafe {
            nativeProcessReadAllStandardError(ptr).toString()
        }
    }

    public func write(data: String): Unit {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeProcessWrite(ptr, d)
            LibC.free(d)
        }
    }

    public func kill(): Unit {
        unsafe {
            nativeProcessKill(ptr)
        }
    }

    public func terminate(): Unit {
        unsafe {
            nativeProcessTerminate(ptr)
        }
    }

    public func exitCode(): Int64 {
        return Int64(unsafe {
            nativeProcessExitCode(ptr)
        })
    }

    public func state(): QProcessState {
        let s = unsafe {
            nativeProcessState(ptr)
        }
        return match (s) {
            case 0 => QProcessState.NotRunning
            case 1 => QProcessState.Starting
            case _ => QProcessState.Running
        }
    }
}

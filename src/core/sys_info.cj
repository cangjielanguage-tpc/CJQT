package cjqt.core

foreign func nativeSysInfoMachineHostName(): CString
foreign func nativeSysInfoProductType(): CString
foreign func nativeSysInfoProductVersion(): CString
foreign func nativeSysInfoKernelType(): CString
foreign func nativeSysInfoKernelVersion(): CString
foreign func nativeSysInfoWordSize(): Int32

public class QSysInfo {
    public static func machineHostName(): String {
        return unsafe { nativeSysInfoMachineHostName().toString() }
    }

    public static func productType(): String {
        return unsafe { nativeSysInfoProductType().toString() }
    }

    public static func productVersion(): String {
        return unsafe { nativeSysInfoProductVersion().toString() }
    }

    public static func kernelType(): String {
        return unsafe { nativeSysInfoKernelType().toString() }
    }

    public static func kernelVersion(): String {
        return unsafe { nativeSysInfoKernelVersion().toString() }
    }

    public static func wordSize(): Int64 {
        return Int64(unsafe { nativeSysInfoWordSize() })
    }
}

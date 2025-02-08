package cjqt.gui

//foreign function 
// foreign func nativePaintDeviceCreate(): Int64
// foreign func nativePaintDeviceDelete(ptr: Int64): Unit

public interface  QPaintDevice {
    // public let ptr: Int64

    // public init() {
    //     this.ptr = unsafe { nativePaintDeviceCreate() }
    // }
    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }
    public func getPtr():Int64

    // public open func delete() {
    //     unsafe { nativePaintDeviceDelete(this.ptr) }
    // }
}

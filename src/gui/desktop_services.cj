package cjqt.gui

foreign func nativeDesktopServicesOpenUrl(url: CString): Bool

public class QDesktopServices {
    public static func openUrl(url: String): Bool {
        return unsafe {
            let u = LibC.mallocCString(url)
            let r = nativeDesktopServicesOpenUrl(u)
            LibC.free(u)
            r
        }
    }
}

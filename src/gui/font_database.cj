package cjqt.gui

import cjqt.core.*

foreign func nativeFontDatabaseFamilies(): Int64
foreign func nativeFontDatabasePointSizes(family: CString): Int64
foreign func nativeFontDatabaseIsFixedPitch(family: CString): Bool
foreign func nativeFontDatabaseIsBold(family: CString): Bool

public class QFontDatabase {
    public static func families(): QStringList {
        return QStringList(ptr: unsafe { nativeFontDatabaseFamilies() })
    }

    public static func pointSizes(family: String): QStringList {
        return QStringList(ptr: unsafe {
            let f = LibC.mallocCString(family)
            let r = nativeFontDatabasePointSizes(f)
            LibC.free(f)
            r
        })
    }

    public static func isFixedPitch(family: String): Bool {
        return unsafe {
            let f = LibC.mallocCString(family)
            let r = nativeFontDatabaseIsFixedPitch(f)
            LibC.free(f)
            r
        }
    }

    public static func isBold(family: String): Bool {
        return unsafe {
            let f = LibC.mallocCString(family)
            let r = nativeFontDatabaseIsBold(f)
            LibC.free(f)
            r
        }
    }
}

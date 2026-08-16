package cjqt.core

foreign func nativeStandardPathsWritableLocation(location: Int32): CString
foreign func nativeStandardPathsLocations(location: Int32): Int64

public enum StandardLocation {
    | DesktopLocation
    | DocumentsLocation
    | FontsLocation
    | ApplicationsLocation
    | MusicLocation
    | MoviesLocation
    | PicturesLocation
    | TempLocation
    | HomeLocation
    | AppLocalDataLocation
    | AppDataLocation
    | DownloadLocation
    | GenericDataLocation
    | RuntimeLocation
    | ConfigLocation
    | AppConfigLocation
    | CacheLocation

    public func value(): Int32 {
        return match (this) {
            case DesktopLocation => 0
            case DocumentsLocation => 1
            case FontsLocation => 2
            case ApplicationsLocation => 3
            case MusicLocation => 4
            case MoviesLocation => 5
            case PicturesLocation => 6
            case TempLocation => 7
            case HomeLocation => 8
            case AppLocalDataLocation => 9
            case AppDataLocation => 10
            case DownloadLocation => 11
            case GenericDataLocation => 12
            case RuntimeLocation => 13
            case ConfigLocation => 14
            case AppConfigLocation => 15
            case CacheLocation => 16
        }
    }
}

public class QStandardPaths {
    public static func writableLocation(location: StandardLocation): String {
        return unsafe {
            nativeStandardPathsWritableLocation(location.value()).toString()
        }
    }

    public static func standardLocations(location: StandardLocation): QStringList {
        let listPtr = unsafe {
            nativeStandardPathsLocations(location.value())
        }
        return QStringList(ptr: listPtr)
    }
}

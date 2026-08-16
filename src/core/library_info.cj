package cjqt.core

foreign func nativeLibraryInfoLocation(location: Int32): CString
foreign func nativeLibraryInfoVersion(): CString

public enum QLibraryLocation {
    | LibrariesPath
    | HeadersPath
    | TranslationsPath
    | PluginsPath
    | DataPath
    | ExamplesPath
    | SettingsPath

    public func value(): Int32 {
        return match (this) {
            case LibrariesPath => 1
            case HeadersPath => 3
            case TranslationsPath => 4
            case PluginsPath => 5
            case DataPath => 6
            case ExamplesPath => 7
            case SettingsPath => 8
        }
    }
}

public class QLibraryInfo {
    public static func location(location: QLibraryLocation): String {
        return unsafe {
            nativeLibraryInfoLocation(location.value()).toString()
        }
    }

    public static func version(): String {
        return unsafe {
            nativeLibraryInfoVersion().toString()
        }
    }
}

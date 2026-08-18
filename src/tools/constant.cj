package cjqt.tools

public enum WidgetAttribute {
    | WA_Disabled
    | WA_UnderMouse
    | WA_MouseTracking
    | WA_ContentsPropagated
    | WA_OpaquePaintEvent
    | WA_MacShowFocusRect
    | WA_TranslucentBackground

    public func value(): Int32 {
        return match (this) {
            case WA_Disabled => 0
            case WA_UnderMouse => 1
            case WA_MouseTracking => 2
            case WA_ContentsPropagated => 3
            case WA_OpaquePaintEvent => 4
            case WA_MacShowFocusRect => 88
            case WA_TranslucentBackground => 9
        }
    }
}

public enum ScrollBarPolicy {
    | ScrollBarAsNeeded
    | ScrollBarAlwaysOff
    | ScrollBarAlwaysOn

    public func value(): Int32 {
        return match (this) {
            case ScrollBarAsNeeded => 0
            case ScrollBarAlwaysOff => 1
            case ScrollBarAlwaysOn => 2
        }
    }
}

public enum ItemDataRole {
    | DisplayRole
    | DecorationRole
    | EditRole
    | ToolTipRole
    | StatusTipRole
    | WhatsThisRole
    | FontRole
    | TextAlignmentRole
    | BackgroundRole
    | ForegroundRole
    | CheckStateRole
    | UserRole

    public func value(): Int32 {
        return match (this) {
            case DisplayRole => 0
            case DecorationRole => 1
            case EditRole => 2
            case ToolTipRole => 3
            case StatusTipRole => 4
            case WhatsThisRole => 5
            case FontRole => 6
            case TextAlignmentRole => 7
            case BackgroundRole => 8
            case ForegroundRole => 9
            case CheckStateRole => 10
            case UserRole => 0x0100
        }
    }
}

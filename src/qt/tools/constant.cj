package qt.tools

public enum WidgetAttribute {
    | WA_Disabled
    | WA_UnderMouse
    | WA_MouseTracking
    | WA_ContentsPropagated
    | WA_OpaquePaintEvent
    | WA_MacShowFocusRect

    public func value(): Int32 {
        return match (this) {
            case WA_Disabled => 0
            case WA_UnderMouse => 1
            case WA_MouseTracking => 2
            case WA_ContentsPropagated => 3
            case WA_OpaquePaintEvent => 4
            case WA_MacShowFocusRect => 88
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

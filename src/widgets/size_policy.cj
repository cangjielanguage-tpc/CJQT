package cjqt.widgets

public enum QSizePolicyPolicy {
    | Fixed
    | Minimum
    | Maximum
    | Preferred
    | Expanding
    | MinimumExpanding
    | Ignored

    public func value(): Int32 {
        return match (this) {
            case Fixed => 0
            case Minimum => 1
            case Maximum => 4
            case Preferred => 5
            case Expanding => 7
            case MinimumExpanding => 3
            case Ignored => 13
        }
    }
}

@C
public struct QSizePolicy {
    public var horizontalPolicy: Int64
    public var verticalPolicy: Int64

    public init(horizontal: QSizePolicyPolicy, vertical: QSizePolicyPolicy) {
        this.horizontalPolicy = Int64(horizontal.value())
        this.verticalPolicy = Int64(vertical.value())
    }

    public func horizontal(): QSizePolicyPolicy {
        return match (horizontalPolicy) {
            case 0 => QSizePolicyPolicy.Fixed
            case 1 => QSizePolicyPolicy.Minimum
            case 4 => QSizePolicyPolicy.Maximum
            case 5 => QSizePolicyPolicy.Preferred
            case 7 => QSizePolicyPolicy.Expanding
            case 3 => QSizePolicyPolicy.MinimumExpanding
            case _ => QSizePolicyPolicy.Ignored
        }
    }

    public func vertical(): QSizePolicyPolicy {
        return match (verticalPolicy) {
            case 0 => QSizePolicyPolicy.Fixed
            case 1 => QSizePolicyPolicy.Minimum
            case 4 => QSizePolicyPolicy.Maximum
            case 5 => QSizePolicyPolicy.Preferred
            case 7 => QSizePolicyPolicy.Expanding
            case 3 => QSizePolicyPolicy.MinimumExpanding
            case _ => QSizePolicyPolicy.Ignored
        }
    }
}

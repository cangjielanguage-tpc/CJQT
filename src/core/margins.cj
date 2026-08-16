package cjqt.core

@C
public struct QMargins {
    public var left: Int64 = 0
    public var top: Int64 = 0
    public var right: Int64 = 0
    public var bottom: Int64 = 0

    public init(left: Int64, top: Int64, right: Int64, bottom: Int64) {
        this.left = left
        this.top = top
        this.right = right
        this.bottom = bottom
    }

    public func isNull(): Bool {
        return left == 0 && top == 0 && right == 0 && bottom == 0
    }

    public func width(): Int64 {
        return left + right
    }

    public func height(): Int64 {
        return top + bottom
    }
}

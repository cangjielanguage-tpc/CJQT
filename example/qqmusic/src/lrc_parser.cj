package qqmusic

import std.collection.*

public class LrcLine {
    public var timeMs: Int64 = 0
    public var text: String = ""
    public init(timeMs: Int64, text: String) {
        this.timeMs = timeMs
        this.text = text
    }
}

// 解析 .lrc 歌词文件，格式：[mm:ss.ms]歌词内容
public class LrcParser {
    public static func parse(content: String): ArrayList<LrcLine> {
        let result = ArrayList<LrcLine>()
        let lines = content.split("\n", removeEmpty: false)
        for (line in lines) {
            let trimmed = line.replace("\r", "")
            if (trimmed.startsWith("[") && trimmed.contains("]")) {
                let closeIdxOpt = trimmed.indexOf("]")
                match (closeIdxOpt) {
                    case Some(closeIdx) =>
                        if (closeIdx > 0) {
                            let tag = trimmed[1..closeIdx]
                            let text = trimmed[closeIdx + 1..]
                            if (text.size > 0) {
                                result.add(LrcLine(parseTime(tag), text))
                            }
                        }
                    case None =>
                        ()
                }
            }
        }
        return result
    }

    static func parseTime(tag: String): Int64 {
        let parts = tag.split(":", removeEmpty: false)
        if (parts.size < 2) {
            return 0
        }
        let minutes = parseDigits(parts[0])
        let rest = parts[1]
        var seconds: Int64 = 0
        var millis: Int64 = 0
        let secParts = rest.split(".", removeEmpty: false)
        if (secParts.size >= 1) {
            seconds = parseDigits(secParts[0])
        }
        if (secParts.size >= 2) {
            millis = parseDigits(secParts[1])
        }
        return minutes * 60000 + seconds * 1000 + millis
    }

    // 手写字符串转非负整数（String 标准库无 toInt64）
    static func parseDigits(digits: String): Int64 {
        var result: Int64 = 0
        let count = digits.size
        var i: Int64 = 0
        while (i < count) {
            let ch = digits[i]
            if (ch >= 48 && ch <= 57) {
                result = result * 10 + (Int64(ch) - 48)
            }
            i += 1
        }
        return result
    }
}

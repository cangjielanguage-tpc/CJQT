package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import std.collection.*

// 全局动画分发（避免构造期间闭包捕获 this）
public class AnimGlobals {
    public static var progressTick: () -> Unit = { => () }
    public static var navTick: () -> Unit = { => () }
    public static var recTick: () -> Unit = { => () }
}// 仿参考项目 BtForm 的导航按钮：
// 图标 + 文本，按下时背景变绿（#1ECE9A），并显示 4 条均衡器动画竖线
public class NavButton <: QWidget {
    let iconLabel: QLabel
    let textLabel: QLabel
    let line1: QLabel
    let line2: QLabel
    let line3: QLabel
    let line4: QLabel
    var pageId: Int64 = 0
    var active = false
    var tickCount: Int64 = 0
    var clickHandler: (Int64) -> Unit = { id => () }

    public init(iconPath: String, text: String, pageId: Int64) {
        this.pageId = pageId
        setFixedHeight(40)

        iconLabel = QLabel()
        iconLabel.setFixedSize(28, 28)
        iconLabel.setStyleSheet(
            "QLabel { background-image: url(${iconPath}); background-repeat: no-repeat; background-position: center center; }")
        textLabel = QLabel(text)
        textLabel.setFontSize(14)
        textLabel.setFontColor(QColor(51, 51, 51))

        line1 = QLabel()
        line1.setFixedWidth(2)
        line1.setFixedHeight(2)
        line1.setStyleSheet("QLabel { background-color: #1ECE9A; }")
        line2 = QLabel()
        line2.setFixedWidth(2)
        line2.setFixedHeight(2)
        line2.setStyleSheet("QLabel { background-color: #1ECE9A; }")
        line3 = QLabel()
        line3.setFixedWidth(2)
        line3.setFixedHeight(2)
        line3.setStyleSheet("QLabel { background-color: #1ECE9A; }")
        line4 = QLabel()
        line4.setFixedWidth(2)
        line4.setFixedHeight(2)
        line4.setStyleSheet("QLabel { background-color: #1ECE9A; }")

        let layout = QHBoxLayout(parent: this)
        layout.setContentsMargins(8, 0, 8, 0)
        layout.setSpacing(6)
        layout.addWidget(iconLabel)
        layout.addWidget(textLabel)
        layout.addStretch(1)
        layout.addWidget(line1)
        layout.addWidget(line2)
        layout.addWidget(line3)
        layout.addWidget(line4)

        setStyleSheet("QWidget { background-color: transparent; }")
        line1.hide()
        line2.hide()
        line3.hide()
        line4.hide()

        setMousePressEvent() {
            event => onPressed()
        }
    }

    public func setClickHandler(handler: (Int64) -> Unit) {
        clickHandler = handler
    }

    public func setActive(active: Bool) {
        this.active = active
        if (active) {
            setStyleSheet("QWidget { background-color: #1ECE9A; }")
            textLabel.setFontColor(QColor.White)
            line1.show()
            line2.show()
            line3.show()
            line4.show()
        } else {
            setStyleSheet("QWidget { background-color: transparent; }")
            textLabel.setFontColor(QColor(51, 51, 51))
            line1.hide()
            line2.hide()
            line3.hide()
            line4.hide()
        }
    }

    public func onPressed() {
        clickHandler(pageId)
    }

    // 由主窗口定时器驱动动画
    public func tick() {
        tickCount += 1
        line1.setFixedHeight(heightForPhase(0))
        line2.setFixedHeight(heightForPhase(5))
        line3.setFixedHeight(heightForPhase(10))
        line4.setFixedHeight(heightForPhase(15))
    }

    func heightForPhase(phase: Int64): Int64 {
        let cycle = (tickCount + phase) % 20
        if (cycle < 10) {
            return cycle
        }
        return 20 - cycle
    }
}

package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import cjqt.tools.*

// 仿参考项目 VolumeTool：自定义绘制音量浮层
// 白色圆角面板 + 灰色槽线 + 绿色已调音量条 + 圆形滑块 + 百分比 + 静音按钮 + 底部三角 + Popup 窗口
public class VolumeTool <: QWidget {
    let volumeWidget: QWidget
    let inLine: QFrame
    let outLine: QFrame
    let silderBtn: QPushButton
    let volumeRatioLabel: QLabel
    let silenceBtn: QPushButton
    var volumeRatio: Int64 = 20
    var muted = false
    var volumeHandler: (Int64) -> Unit = { v => () }
    var muteHandler: (Bool) -> Unit = { m => () }

    public init() {
        volumeWidget = QWidget()
        inLine = QFrame()
        outLine = QFrame()
        silderBtn = QPushButton()
        volumeRatioLabel = QLabel()
        silenceBtn = QPushButton()

        setWindowFlag(WindowType.Popup.value(), true)
        setWindowFlag(WindowType.FramelessWindowHint.value(), true)
        setWindowFlag(WindowType.NoDropShadowWindowHint.value(), true)
        setAttribute(WidgetAttribute.WA_TranslucentBackground, true)
        setFixedSize(100, 350)
        setStyleSheet("QWidget { background: transparent; }")

        // 白色圆角面板（局部坐标 10,10 80x300）
        volumeWidget.setParent(this)
        volumeWidget.setGeometry(10, 10, 80, 300)
        volumeWidget.setStyleSheet(
            "QWidget { background-color: #FFFFFF; border-radius: 5px; border: 1px solid #D8D8D8; }")

        // 灰色槽线（面板内 y25 高180 -> this 内 y35）
        inLine.setParent(this)
        inLine.setGeometry(48, 35, 4, 180)
        inLine.setStyleSheet("QFrame { background-color: #ECECEC; border: none; }")

        // 绿色已调音量条
        outLine.setParent(this)
        outLine.setStyleSheet("QFrame { background-color: #1ECC94; border: none; }")

        // 圆形滑块
        silderBtn.setParent(this)
        silderBtn.setFixedSize(14, 14)
        silderBtn.setStyleSheet("QPushButton { border-radius: 7px; background-color: #1ECC94; border: none; }")

        // 音量百分比
        volumeRatioLabel.setParent(this)
        volumeRatioLabel.setFixedHeight(30)
        volumeRatioLabel.setStyleSheet(
            "QLabel { color: #333333; font-size: 13px; qproperty-alignment: 'AlignCenter'; background: transparent; }")

        // 静音按钮（图标）
        silenceBtn.setParent(this)
        silenceBtn.setFixedSize(80, 45)
        silenceBtn.setStyleSheet(muteStyle())

        // 静音按钮/百分比位置（面板底部：面板 y225-270 -> this y235-280）
        silenceBtn.move(10, 265)
        volumeRatioLabel.setGeometry(10, 235, 80, 30)

        updateVolumeUI()
        setupMouse()
        setupPaint()

        silenceBtn.clicked.connect() {
            d => toggleMute()
        }
    }

    // 底部三角绘制（仿参考项目 paintEvent，用三条线闭合勾勒白色三角）
    func setupPaint() {
        setPaintEvent() {
            event =>
            let painter = QPainter(this)
            painter.setPen(QPen(QColor.White, 2.0))
            painter.setBrush(QBrush(QColor.White))
            painter.drawLine(20, 300, 80, 300)
            painter.drawLine(20, 300, 50, 320)
            painter.drawLine(80, 300, 50, 320)
            painter.delete()
        }
    }

    // 鼠标按下/拖动调节音量（仿参考项目 calcVolume）
    func setupMouse() {
        setMousePressEvent() {
            e => handleVolumeEvent()
        }
        setMouseMoveEvent() {
            e => handleVolumeEvent()
        }
        setMouseReleaseEvent() {
            e => volumeHandler(volumeRatio)
        }
    }

    func handleVolumeEvent() {
        let pos = QCursor.pos()
        // 音量条局部 y 有效范围 [25,205]（相对 volumeBox，其全局 y=10）
        var y = Int64(pos.y) - 10
        if (y < 25) {
            y = 25
        }
        if (y > 205) {
            y = 205
        }
        let h = 205 - y
        // outLine 全局 y = 10(volumeBox) + y(局部)
        outLine.setGeometry(48, Int32(10 + y), 4, Int32(h))
        silderBtn.move(43, Int32(10 + y - 7))
        volumeRatio = h * 100 / 180
        if (volumeRatio > 100) {
            volumeRatio = 100
        }
        volumeRatioLabel.setText("${volumeRatio}%")
        volumeHandler(volumeRatio)
    }

    func updateVolumeUI() {
        let h = volumeRatio * 180 / 100
        let y = 205 - h
        outLine.setGeometry(48, Int32(10 + y), 4, Int32(h))
        silderBtn.move(43, Int32(10 + y - 7))
        volumeRatioLabel.setText("${volumeRatio}%")
    }

    public func setVolumeHandler(handler: (Int64) -> Unit) {
        volumeHandler = handler
    }

    public func setMuteHandler(handler: (Bool) -> Unit) {
        muteHandler = handler
    }

    public func toggleMute() {
        muted = !muted
        silenceBtn.setStyleSheet(muteStyle())
        muteHandler(muted)
    }

    public func setMuted(muted: Bool) {
        this.muted = muted
        silenceBtn.setStyleSheet(muteStyle())
    }

    public func setVolume(v: Int64) {
        volumeRatio = v
        updateVolumeUI()
    }

    func muteStyle(): String {
        let icon = if (muted) { "images/silent.png" } else { "images/volumn.png" }
        return "QPushButton { border: none; background-image: url(${icon}); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #E0E0E0; }"
    }
}

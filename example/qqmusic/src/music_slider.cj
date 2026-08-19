package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

// 仿参考项目 MusicSlider：自定义播放进度条
// inLine 灰底槽(#EBEEF5) + outLine 绿色进度(#1ECC94)，鼠标点击/拖拽设置进度
// 拖拽释放后回调播放位置（参考项目 musicslider.cpp）
public class MusicSlider <: QWidget {
    let inLine: QFrame
    let outLine: QFrame
    var maxWidth: Int64 = 0
    var currentPos: Int64 = 0
    var seekHandler: (Float64) -> Unit = { ratio => () }

    public init() {
        inLine = QFrame()
        outLine = QFrame()

        setFixedHeight(20)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")

        // 灰色底槽：y8 高4，贯穿宽度
        inLine.setParent(this)
        inLine.setStyleSheet("QFrame { background-color: #EBEEF5; border: none; }")
        inLine.setGeometry(0, 8, 840, 4)

        // 绿色进度条：y8 高4，宽度随进度
        outLine.setParent(this)
        outLine.setStyleSheet("QFrame { background-color: #1ECC94; border: none; }")
        outLine.setGeometry(0, 8, 420, 4)

        maxWidth = 840
        currentPos = 0
        moveSlider()

        setupMouse()
    }

    func setupMouse() {
        setMousePressEvent() {
            e =>
            let pos = QCursor.pos()
            setCurrentPosFromGlobal(pos.x)
        }
        setMouseMoveEvent() {
            e =>
            if (e.buttons() == 1) {
                let pos = QCursor.pos()
                setCurrentPosFromGlobal(pos.x)
            }
        }
        setMouseReleaseEvent() {
            e =>
            let pos = QCursor.pos()
            setCurrentPosFromGlobal(pos.x)
            seekHandler(Float64(currentPos) / Float64(maxWidth))
        }
    }

    // 全局x转当前widget内坐标
    func setCurrentPosFromGlobal(globalX: Int32) {
        let p = mapToGlobal()
        var x = Int64(globalX) - Int64(p.x)
        if (x < 0) {
            x = 0
        }
        if (x > maxWidth) {
            x = maxWidth
        }
        currentPos = x
        moveSlider()
    }

    // 设置进度（0.0 - 1.0），来自播放器播放位置轮询
    public func setProgress(ratio: Float64) {
        currentPos = Int64(Float64(maxWidth) * ratio)
        if (currentPos < 0) {
            currentPos = 0
        }
        if (currentPos > maxWidth) {
            currentPos = maxWidth
        }
        moveSlider()
    }

    // 设置进度变更回调（拖拽释放时通知播放位置）
    public func setSeekHandler(handler: (Float64) -> Unit) {
        seekHandler = handler
    }

    func moveSlider() {
        outLine.setGeometry(0, 8, Int32(currentPos), 4)
    }
}

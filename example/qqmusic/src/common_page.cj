package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

// 仿参考项目 CommonPage：音乐列表页（我喜欢 / 本地下载 / 最近播放）
public class CommonPage <: QWidget {
    let listWidget: QListWidget
    var pageTitle = ""
    var playAllHandler: () -> Unit = { => () }

    public init() {
        listWidget = QListWidget()
        setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(16, 12, 16, 12)
        layout.setSpacing(8)

        let title = QLabel(pageTitle)
        title.setFontSize(18)
        title.setFontColor(QColor(51, 51, 51))
        layout.addWidget(title)

        // 表头行：图片 + 歌名/歌手/专辑列 + 播放全部
        let header = QWidget()
        header.setFixedHeight(40)
        let headerLayout = QHBoxLayout(parent: header)
        headerLayout.setContentsMargins(0, 0, 0, 0)
        headerLayout.setSpacing(8)

        let image = QLabel()
        image.setFixedSize(120, 36)
        image.setStyleSheet(
            "QLabel { background-image: url(images/ilikebg.png); background-repeat: no-repeat; background-position: center center; }")
        headerLayout.addWidget(image)

        let nameHeader = QLabel("歌名")
        nameHeader.setFontSize(12)
        nameHeader.setFontColor(QColor(120, 120, 120))
        nameHeader.setFixedWidth(300)
        headerLayout.addWidget(nameHeader)

        let singerHeader = QLabel("歌手")
        singerHeader.setFontSize(12)
        singerHeader.setFontColor(QColor(120, 120, 120))
        singerHeader.setFixedWidth(120)
        headerLayout.addWidget(singerHeader)

        let albumHeader = QLabel("专辑")
        albumHeader.setFontSize(12)
        albumHeader.setFontColor(QColor(120, 120, 120))
        headerLayout.addWidget(albumHeader)

        let playAllBtn = QPushButton("▶ 播放全部")
        playAllBtn.setFixedSize(120, 32)
        playAllBtn.setStyleSheet(
            "QPushButton { color: #ffffff; background-color: #31c27c; border: none; border-radius: 16px; font-size: 13px; } QPushButton:hover { background-color: #3dd690; }")
        playAllBtn.clicked.connect() {
            d => playAllHandler()
        }
        headerLayout.addWidget(playAllBtn)

        layout.addWidget(header)

        listWidget.setStyleSheet(
            "QListWidget { background-color: #ffffff; color: #333333; border: none; font-size: 14px; } QListWidget::item { height: 40px; padding-left: 8px; border-bottom: 1px solid #f0f0f0; } QListWidget::item:hover { background-color: #f0f0f0; } QListWidget::item:selected { background-color: #d5f5e8; color: #1ECD97; }")
        layout.addWidget(listWidget)
    }

    public func setPageTitle(title: String) {
        pageTitle = title
    }

    public func setPlayAllHandler(handler: () -> Unit) {
        playAllHandler = handler
    }

    public func addMusic(name: String) {
        listWidget.addItem(name)
    }

    public func clear() {
        listWidget.clear()
    }

    public func currentRow(): Int64 {
        return listWidget.currentRow()
    }

    public func setCurrentRow(row: Int64) {
        listWidget.setCurrentRow(row)
    }

    public func musicNameAt(index: Int64): String {
        return listWidget.itemText(index)
    }
}

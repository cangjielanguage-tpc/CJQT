package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import cjqt.tools.*
import std.collection.*

// 仿参考项目 CommonPage：音乐列表页（完全按 commonpage.ui 布局）
// PageTittle + musicPlayBox(图片150+播放全部120) + listLabelBox(歌名/歌手/专辑) + 列表
// 列表用 QListWidget + setItemWidget 自定义行（likeBtn + 歌名 + 歌手 + 专辑）
public class CommonPage <: QWidget {
    let titleLabel: QLabel
    let headerImage: QLabel
    let listWidget: QListWidget
    let names = ArrayList<String>()
    var pageTitle = ""
    var playAllHandler: () -> Unit = { => () }

    public init() {
        titleLabel = QLabel(pageTitle)
        headerImage = QLabel()
        listWidget = QListWidget()
        setStyleSheet("QWidget { background-color: #F5F5F5; }")

        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(3, 0, 3, 0)
        layout.setSpacing(0)

        // PageTittle：30px 高
        titleLabel.setFixedHeight(30)
        titleLabel.setFontSize(18)
        titleLabel.setFontColor(QColor(51, 51, 51))
        layout.addWidget(titleLabel)

        // musicPlayBox：150px 高，水平布局
        let playBox = QWidget()
        playBox.setFixedHeight(150)
        let playBoxLayout = QHBoxLayout(parent: playBox)
        playBoxLayout.setContentsMargins(0, 0, 0, 0)
        playBoxLayout.setSpacing(16)

        // musicImageLabel：150px 宽封面图（图片缩放铺满，6px 内边距）
        headerImage.setFixedWidth(150)
        headerImage.setFixedHeight(150)
        headerImage.setPixmapScaled("images/ilikebg.png", 138, 138)
        playBoxLayout.addWidget(headerImage)

        // playAll：120px 宽，垂直布局(spacer + 播放全部按钮)
        let playAllBox = QWidget()
        playAllBox.setFixedWidth(120)
        let playAllLayout = QVBoxLayout(parent: playAllBox)
        playAllLayout.setContentsMargins(0, 0, 0, 0)
        playAllLayout.setSpacing(0)
        playAllLayout.addStretch(1)
        let playAllBtn = QPushButton("播放全部")
        playAllBtn.setFixedSize(100, 30)
        playAllBtn.setStyleSheet(
            "QPushButton { background-color: #E3E3E3; border-radius: 10px; color: #333333; font-size: 13px; border: none; } QPushButton:hover { background-color: #1ECD97; color: #ffffff; }")
        playAllBtn.clicked.connect() {
            d => playAllHandler()
        }
        playAllLayout.addWidget(playAllBtn)
        playAllLayout.addStretch(1)
        playBoxLayout.addWidget(playAllBox)

        playBoxLayout.addStretch(1)
        layout.addWidget(playBox)

        // listLabelBox：40px 高列头 = 歌名(380) + 歌手(130) + 专辑
        let labelBox = QWidget()
        labelBox.setFixedHeight(40)
        let labelLayout = QHBoxLayout(parent: labelBox)
        labelLayout.setContentsMargins(0, 0, 0, 0)
        labelLayout.setSpacing(0)

        let nameHeader = QLabel("歌曲名称")
        nameHeader.setFontSize(12)
        nameHeader.setFontColor(QColor(120, 120, 120))
        nameHeader.setFixedWidth(380)
        labelLayout.addWidget(nameHeader)

        let singerHeader = QLabel("歌手名称")
        singerHeader.setFontSize(12)
        singerHeader.setFontColor(QColor(120, 120, 120))
        singerHeader.setFixedWidth(130)
        labelLayout.addWidget(singerHeader)

        let albumHeader = QLabel("专辑名称")
        albumHeader.setFontSize(12)
        albumHeader.setFontColor(QColor(120, 120, 120))
        labelLayout.addWidget(albumHeader)

        layout.addWidget(labelBox)

        // pageMusicList：歌曲列表（QListWidget，行顶部对齐，原生滚动）
        listWidget.setStyleSheet(
            "QListWidget { background-color: #ffffff; color: #333333; border: none; font-size: 14px; } QListWidget::item { height: 45px; border-bottom: 1px solid #F0F0F0; padding-left: 16px; padding-right: 16px; } QListWidget::item:hover { background-color: #F5F5F5; } QListWidget::item:selected { background-color: #EFEFEF; }")
        // 隐藏滑动条（列表项内边距由 setItemWidget 行内设置）
        listWidget.setVerticalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
        listWidget.setHorizontalScrollBarPolicy(ScrollBarPolicy.ScrollBarAlwaysOff)
        layout.addWidget(listWidget)
    }

    public func setPageTitle(title: String) {
        pageTitle = title
        titleLabel.setText(title)
    }

    public func setPageImage(imagePath: String) {
        headerImage.setPixmapScaled(imagePath, 138, 138)
    }

    public func setPlayAllHandler(handler: () -> Unit) {
        playAllHandler = handler
    }

    // 仿参考项目 ListItemBox：likeBtn + 歌名 + 歌手 + 专辑（setItemWidget 自定义行）
    // likeHandler: 点击喜欢按钮时回调，参数为期望状态，返回实际切换后的状态
    // playHandler: 点击播放按钮时回调，播放该行歌曲
    public func addMusic(name: String, singer: String, album: String, isLike: Bool, likeHandler: (Bool) -> Bool, playHandler: () -> Unit) {
        let index = listWidget.count()
        listWidget.addItem("")
        let row = makeRow(name, singer, album, isLike, likeHandler, playHandler)
        listWidget.setItemWidget(index, row)
        names.add(name)
    }

    func makeRow(name: String, singer: String, album: String, isLike: Bool, likeHandler: (Bool) -> Bool, playHandler: () -> Unit): QWidget {
        let row = QWidget()
        row.setFixedHeight(45)
        row.setStyleSheet("QWidget { background-color: #ffffff; border-bottom: 1px solid #F0F0F0; }")
        let rowLayout = QHBoxLayout(parent: row)
        rowLayout.setContentsMargins(12, 0, 12, 0)
        rowLayout.setSpacing(0)

        // 歌名区：380px 宽（like 图标 + 歌名）
        let nameBox = QWidget()
        nameBox.setFixedWidth(380)
        let nameBoxLayout = QHBoxLayout(parent: nameBox)
        nameBoxLayout.setContentsMargins(0, 0, 0, 0)
        nameBoxLayout.setSpacing(4)

        let likeBtn = QPushButton()
        likeBtn.setFixedSize(25, 25)
        likeBtn.setStyleSheet(likeStyle(isLike))
        likeBtn.clicked.connect() {
            d =>
            // 仅触发回调；回调会刷新所有列表页并重建行，likeBtn 随后被销毁，
            // 因此不能在回调后访问 likeBtn（会访问已释放内存导致崩溃）
            likeHandler(!isLike)
        }
        nameBoxLayout.addWidget(likeBtn)

        let nameLabel = QLabel(name)
        nameLabel.setStyleSheet("QLabel { color: #333333; font-size: 14px; background: transparent; }")
        nameBoxLayout.addWidget(nameLabel)
        nameBoxLayout.addStretch(1)
        rowLayout.addWidget(nameBox)

        // 歌手区：130px 宽
        let singerLabel = QLabel(singer)
        singerLabel.setFixedWidth(130)
        singerLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(singerLabel)

        // 专辑区
        let albumLabel = QLabel(album)
        albumLabel.setStyleSheet("QLabel { color: #666666; font-size: 13px; background: transparent; }")
        rowLayout.addWidget(albumLabel)
        rowLayout.addStretch(1)

        // 播放按钮：点击播放该行歌曲
        let playBtn = QPushButton()
        playBtn.setFixedSize(25, 25)
        playBtn.setStyleSheet(
            "QPushButton { border: none; background-image: url(images/play3.png); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #E0E0E0; border-radius: 12px; }")
        playBtn.clicked.connect() {
            d => playHandler()
        }
        rowLayout.addWidget(playBtn)

        return row
    }

    func likeStyle(liked: Bool): String {
        let icon = if (liked) { "images/like_2.png" } else { "images/like_3.png" }
        return "QPushButton { border: none; background-image: url(${icon}); background-repeat: no-repeat; background-position: center center; }"
    }

    public func clear() {
        listWidget.clear()
        names.clear()
    }

    public func currentRow(): Int64 {
        return listWidget.currentRow()
    }

    public func setCurrentRow(row: Int64) {
        listWidget.setCurrentRow(row)
    }

    public func musicNameAt(index: Int64): String {
        if (index >= 0 && index < names.size) {
            return names[index]
        }
        return ""
    }
}

package gui

from cjqt import qt.widgets.*

public class LeftPanel <: QScrollArea {
    public init(parent!: QWidget = QWidget(0)) {
        super(parent: parent)
        setWidgetResizable(true)
        setFrameShape(QFrameShape.NoFrame)

        let p = ILeftPanel(parent: this)
        setWidget(p)
        setMaximumWidth(280)
    }
}

class ILeftPanel <: QFrame {
    public init(parent!: QWidget = QWidget(0)) {
        super(parent)

        let layout = QVBoxLayout(parent: this)

        let libraryHeader = QLabel("音乐提供方")
        let collectionsHeader = QLabel("本地收藏")
        collectionsHeader.setToolTip(
            """
        我们可以在本地建立『收藏集』来收藏自己喜欢的音乐资源

        每个收藏集都以一个独立 .fuo 文件的存在，将鼠标悬浮在收藏集上，可以查看文件所在路径。
        新建 fuo 文件，则可以新建收藏集，文件名即是收藏集的名字。

        手动编辑 fuo 文件即可编辑收藏集中的音乐资源，也可以在界面上拖拽来增删歌曲。
"""
        )
        let playlistsHeader = QLabel("歌单列表")
        let myMusicHeader = QLabel("我的音乐")

        layout.setSpacing(0)
        layout.setContentsMargins(6, 4, 0, 0)

        layout.addWidget(libraryHeader)
        layout.addWidget(collectionsHeader)
        layout.addWidget(playlistsHeader)
        layout.addWidget(myMusicHeader)
        layout.addStretch(0)
    }
}

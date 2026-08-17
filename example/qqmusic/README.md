# QQMusic 仓颉版

参照 `/home/wathinst/cjproject/qqmusic`（Qt C++ 版 QQMusic）的 **UI 与效果**，使用 **CJQT 库**（仓颉语言 Qt 绑定）一比一复刻的音乐播放器示例。

## 界面（一比一复刻）

- 主窗口 1044×704，浅色主题（左侧栏 #F0F0F0，右侧 #F5F5F5）
- **顶部**（80px）：左侧 Logo 区 + 右侧搜索框（圆角 #E3E3E3）+ 换肤/最小化/最大化/关闭按钮（30×30 图标）
- **左侧导航**（200px）：在线音乐（推荐/电台/音乐馆）、我的音乐（我喜欢/本地下载/最近播放）
  - 导航项：图标 + 文本，按下背景变绿（#1ECE9A），并显示 **4 条均衡器动画竖线**（类似 BtForm 的 QPropertyAnimation 效果，用定时器驱动高度变化实现）
- **右侧内容**：QStackedWidget 六页
  - 推荐页：今日为你推荐 / 你的音乐补给（RecBox 图片宫格 + 左右翻页箭头）
  - 电台 / 音乐馆：占位页
  - 我喜欢 / 本地下载 / 最近播放：音乐列表页（表头：图片+歌名/歌手/专辑+播放全部，列表项悬停/选中变色）
  - 歌词页
- **底部控制栏**：
  - 自定义播放进度条（灰槽绿滑块，仿 MusicSlider）
  - 封面 60×60 + 歌名/歌手
  - 播放控制：模式（顺序/单曲/随机）、上一曲、播放/暂停、下一曲、音量、添加
  - 时间显示 00:00 / 00:00 + 歌词按钮
  - 音量浮层（白色圆角面板 + 垂直滑块 + 静音，仿 VolumeTool）

## 功能

- 本地音乐扫描：加载 `musics` 目录下 mp3/wav/flac（QDir + QFile）
- 播放/暂停、上一曲/下一曲、播放模式切换
- 进度与时间实时更新（QTimer 轮询 QMediaPlayer.position/duration）
- 音量调节与静音

## 涉及 CJQT 类

多媒体：`QMediaPlayer` / `QMediaPlaylist`
控件：`QStackedWidget` / `QListWidget` / `QSlider` / `QPushButton` / `QLabel` / `QLineEdit` / `QScrollArea`
布局：`QVBoxLayout` / `QHBoxLayout`
文件：`QDir` / `QFile`；定时：`QTimer`；应用：`QApplication`

## 使用说明

将音乐文件放入 `musics` 目录（含同名 `.lrc` 歌词文件可显示歌词），然后运行：

```shell
./example/qqmusic/run.sh
```

> 示例自带 `musics/Andy阿杜.mp3`，可直接播放。
> 运行需要图形环境；无音频后端时可正常启动界面与播放列表，播放静默。

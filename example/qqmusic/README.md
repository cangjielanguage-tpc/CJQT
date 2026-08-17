# QQMusic 仓颉版

参考 `/home/wathinst/cjproject/qqmusic`（Qt C++ 版 QQMusic），使用 **CJQT 库**（仓颉语言 Qt 绑定）实现的一个音乐播放器示例。

## 功能

- 深色 QQMusic 风格界面（QSS 样式）
- 左侧导航：推荐 / 本地音乐 / 歌词 三页（QStackedWidget）
- 本地音乐扫描：自动加载 `musics` 目录下的 mp3/wav/flac 文件（QDir + QFile）
- 音乐播放：播放/暂停、上一曲、下一曲、播放模式切换（顺序/单曲/随机/列表）
- 播放进度条（QSlider + QTimer 轮询 QMediaPlayer.position）
- 音量调节与静音
- 歌词显示：加载同名 `.lrc` 文件（QTextEdit）

## 涉及 CJQT 类

`QMediaPlayer` / `QMediaPlaylist`（多媒体）、`QStackedWidget` / `QListWidget` / `QSlider` / `QPushButton` / `QLabel` / `QTextEdit`（控件）、`QVBoxLayout` / `QHBoxLayout`（布局）、`QDir` / `QFile`（文件系统）、`QTimer`（定时器）、`QApplication`。

## 使用说明

将音乐文件（mp3/wav/flac）放入 `musics` 目录（含同名 `.lrc` 歌词文件可显示歌词），然后运行：

```shell
./example/qqmusic/run.sh
```

或：

```shell
cd example/qqmusic
cjpm update
cjpm build
./target/release/bin/main
```

> 示例自带一首示例歌曲 `musics/Andy阿杜.mp3`，可直接播放。
> 运行需要图形环境；无音频后端时可正常启动界面与播放列表，播放静默。

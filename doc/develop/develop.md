# CJQT库开发参考文档

## 源码结构

```shell
├── native
│   ├── src
│   │   ├── code
│   │   ├── gui
│   │   └── widgets
│   └── CMakeLists.txt
├── src
│   ├── qt
│   │   ├── code
│   │   ├── gui
└── └── └── widgets

```

- `native`是C语言绑定QT库源码目录
- `src`是库源码目录

## 封装QLabel组件

### QLabel绑定C接口

#### label.h

创建native/src/widgets/label.h头文件。

所有widgets组件需要引用widget.h头文件，该头文件定义了一些虚函数实现的宏。

新建CjQtLabel类继承于QLabel。

根据需要添加虚函数实现的宏定义：
- `PAINT_EVENT` 组件绘制事件
- `MOUSE_PRESS_EVENT` 鼠标按下事件
- `MOUSE_RELEASE_EVENT` 鼠标释放事件
- `MOUSE_MOVE_EVENT` 鼠标移动事件
- `KEY_PRESS_EVENT` 按键按下事件


```c
#ifndef __LABEL_H_
#define __LABEL_H_

#include <QLabel>
#include "widget.h"

class CjQtLabel : public QLabel
{
    // Q_OBJECT
public:
    CjQtLabel(QWidget *parent = nullptr) : QLabel(parent) {}

protected:
    PAINT_EVENT(QLabel::paintEvent(event))

    MOUSE_PRESS_EVENT(QLabel::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QLabel::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QLabel::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QLabel::keyPressEvent(event))
};

#endif
```

#### label.cpp

创建native/src/widgets/label.cpp源文件。

为仓颉提供C语言绑定接口：nativeLabelCreate(创建QLabel)、nativeLabelDelete(删除QLabel)和nativeLabelSetText(设置QLabel文本)。

实现nativeLabelCreate函数，APPLICATION_CREATE对于widgets组件是必要的，该宏定义了QApplication的初始化构建。

实现nativeLabelDelete函数，虽然QT有自动的内存管理，预留该接口可以提供上层更灵活的控制。

nativeLabelSetText函数实现QLable组件的具体功能，这里是设置显示文本。

```cpp
#include "label.h"

extern "C"
{

	// QLabel

    long nativeLabelCreate(long parentPtr)
	{
        APPLICATION_CREATE
		CjQtLabel *label;
        if (parentPtr == 0L){
            label = new CjQtLabel();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtLabel(parent);
        }
		return reinterpret_cast<long>(label);
	}

	void nativeLabelDelete(long ptr)
	{
		CjQtLabel *instance = reinterpret_cast<CjQtLabel *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}

    void nativeLabelSetText(long ptr, const char *text){
        QLabel *instance = reinterpret_cast<QLabel *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }
}
```

#### 编译

将label.cpp源文件路径添加到CMakeLists.txt配置文件中，

运行编译命令，成功则生成libnativeQt.so到native/lib/x86_64路径下。

```shell
$ ./build_native.sh 
-- Configuring done
-- Generating done
-- Build files have been written to: /home/wathinst/cjProject/qt/native/build
[  2%] Automatic MOC and UIC for target nativeQt
[  2%] Built target nativeQt_autogen
[100%] Built target nativeQt
```

### QLabel仓颉封装

#### label.cj

创建src/qt/widgets/label.cj仓颉源文件。

通过 `foreign` 关键字声明C接口函数

```cangjie
foreign func nativeLabelCreate(parentPtr: Int64): Int64
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
foreign func nativeLabelDelete(ptr: Int64): Unit
```

新建QLabel类并继承自QWidget，注意构造函数需要传入QLabel组件的对象指针，所有关于QLabel组件的操作都是通过该指针进行的。

分别实现QLabel的创建、删除和设置文本：

```cangjie
public class QLabel <: QWidget{

    public init(parent: QWidget) {
        super(unsafe {
            nativeLabelCreate(parent.ptr)
        })
    }

    public override func delete() {
        unsafe {
            nativeLabelDelete(ptr)
        }
    }

    public func setText(text:String) {
        unsafe {
            nativeLabelSetText(ptr, CString(text))
        }
    }
}
```

#### 编译

运行编译命令：

```shell
$ ./build.sh
cpm update success
cpm build success
```
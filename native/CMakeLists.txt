cmake_minimum_required(VERSION 3.5)

project(nativeQt LANGUAGES CXX)

# set(CMAKE_CXX_FLAGS   "-g")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (CMAKE_PREFIX_PATH $ENV{QT_HOME})

find_package(Qt5 COMPONENTS Core Widgets Qml REQUIRED )

# gtk头文件路径
include_directories(${GTK3_INCLUDE_DIRS})
# gtk库路径
link_directories(${GTK3_LIBRARY_DIRS})

add_library(nativeQt SHARED 
        ./src/widgets/application.cpp
        ./src/widgets/widget.cpp
        ./src/widgets/main_window.cpp
        ./src/widgets/qml_application_engine.cpp
        ./src/widgets/label.cpp
        ./src/widgets/grid_layout.cpp
        ./src/widgets/push_button.cpp
        ./src/widgets/message_box.cpp
        ./src/widgets/menu_bar.cpp
        ./src/widgets/menu.cpp
        ./src/widgets/action.cpp
        ./src/widgets/file_dialog.cpp
        ./src/widgets/text_edit.cpp
        ./src/widgets/check_box.cpp
        ./src/widgets/group_box.cpp
        ./src/code/url.cpp
        ./src/code/timer.cpp
        ./src/gui/mouse_event.cpp
        ./src/gui/key_event.cpp
        ./src/gui/painter_event.cpp
        ./src/gui/painter.cpp
        ./src/gui/pen.cpp
        ./src/gui/color.cpp
        ./src/gui/brush.cpp
        ./src/gui/pixmap.cpp
        ./src/gui/palette.cpp
        ./src/gui/font.cpp
)

target_link_libraries(nativeQt PRIVATE Qt5::Core Qt5::Widgets Qt5::Qml)

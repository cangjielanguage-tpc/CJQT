cmake_minimum_required(VERSION 3.5)

project(nativeQtTest LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH $ENV{QT_HOME})

find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)

include_directories(../../native/includes)
include_directories(../../native/includes/widgets)
include_directories(../../native/includes/core)
include_directories(../../native/includes/gui)

link_directories(../../native/lib/x86_64)

add_executable(native_test
    test_main.cpp
    test_core.cpp
    test_gui.cpp
    test_widgets.cpp
)

target_link_libraries(native_test PRIVATE nativeQt Qt5::Core Qt5::Gui Qt5::Widgets)

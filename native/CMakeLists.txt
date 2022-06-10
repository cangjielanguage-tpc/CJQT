cmake_minimum_required(VERSION 3.5)

project(nativeQt LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (CMAKE_PREFIX_PATH "/home/wathinst/Qt5.14.2/5.14.2/gcc_64")

find_package(Qt5 COMPONENTS Core Widgets Qml REQUIRED )

# gtk头文件路径
include_directories(${GTK3_INCLUDE_DIRS})
# gtk库路径
link_directories(${GTK3_LIBRARY_DIRS})

add_library(nativeQt SHARED 
        ./src/application.cpp
        ./src/main_window.cpp
        ./src/qml_application_engine.cpp
        ./src/url.cpp
)

target_link_libraries(nativeQt PRIVATE Qt5::Core Qt5::Widgets Qt5::Qml)

cmake_minimum_required(VERSION 3.5)

project(nativeQt LANGUAGES CXX)

# set(CMAKE_CXX_FLAGS   "-g")

# set(CMAKE_SYSTEM_PROCESSOR arm64)

# set(tools ~/ohos/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu)
# set(CMAKE_C_COMPILER aarch64-linux-gnu-g++)
# set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (CMAKE_PREFIX_PATH $ENV{QT_HOME})
# set (CMAKE_PREFIX_PATH ~/qtsource/qt-everywhere-src-5.14.2/out/aarch64-qt)
# set (CMAKE_PREFIX_PATH D:\Software\Qt\Qt5.14.2\Tools\mingw730_64)

set (INC_DIR ./includes 
        ./includes/widgets
        ./includes/core
        ./includes/gui
)

set (SRC_DIR ./src/widgets/application.cpp
        ./src/widgets/widget.cpp
        ./src/widgets/main_window.cpp
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
        ./src/widgets/radio_button.cpp
        ./src/widgets/layout.cpp
        ./src/widgets/box_layout.cpp
        ./src/widgets/h_box_layout.cpp
        ./src/widgets/v_box_layout.cpp
        ./src/widgets/status_bar.cpp
        ./src/widgets/tool_bar.cpp
        ./src/widgets/dialog.cpp
        ./src/widgets/dialog_button_box.cpp
        ./src/widgets/table_view.cpp
        ./src/widgets/header_view.cpp
        ./src/widgets/font_dialog.cpp
        ./src/widgets/line_edit.cpp
        ./src/widgets/frame.cpp
        ./src/widgets/abstract_scroll_area.cpp
        ./src/widgets/abstract_slider.cpp
        ./src/widgets/scroll_bar.cpp
        ./src/widgets/graphics_scene.cpp
        ./src/widgets/graphics_view.cpp
        ./src/widgets/graphics_item.cpp
        ./src/widgets/graphics_line_item.cpp
        ./src/widgets/graphics_ellipse_item.cpp
        ./src/widgets/action_group.cpp
        ./src/widgets/graphics_scene_mouse_event.cpp
        ./src/widgets/graphics_scene_event.cpp
        ./src/widgets/abstract_graphics_shape_item.cpp
        ./src/widgets/graphics_rect_item.cpp
        ./src/widgets/tab_bar.cpp
        ./src/widgets/tab_widget.cpp
        ./src/widgets/splitter.cpp
        ./src/widgets/splitter_handle.cpp
        ./src/widgets/scroll_area.cpp
        ./src/widgets/list_view.cpp
        ./src/widgets/abstract_item_view.cpp
        ./src/widgets/abstract_item_delegate.cpp
        ./src/widgets/styled_item_delegate.cpp
        ./src/widgets/dock_widget.cpp
        ./src/widgets/tree_view.cpp
        ./src/widgets/mdi_area.cpp
        ./src/core/url.cpp
        ./src/core/timer.cpp
        ./src/core/rect.cpp
        ./src/core/size.cpp
        ./src/core/event.cpp
        ./src/core/conversion.cpp
        ./src/core/cj_object.cpp
        ./src/core/point_f.cpp
        ./src/core/rect_f.cpp
        ./src/core/point.cpp
        ./src/core/size_f.cpp
        ./src/core/line_f.cpp
        ./src/core/abstract_item_model.cpp
        ./src/core/abstract_list_model.cpp
        ./src/core/string_list.cpp
        ./src/core/string_list_model.cpp
        ./src/core/model_index.cpp
        ./src/core/variant.cpp
        ./src/core/item_selection_model.cpp
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
        ./src/gui/icon.cpp
        ./src/gui/validator.cpp
        ./src/gui/double_validator.cpp
        ./src/gui/paint_device.cpp
        ./src/gui/transform.cpp
        ./src/gui/polygon.cpp
        ./src/gui/polygon_f.cpp
        ./src/gui/standard_item_model.cpp
        ./src/gui/standard_item.cpp
        ./src/gui/gui_application.cpp
        ./src/gui/screen.cpp
        ./src/gui/text_option.cpp
        ./src/gui/gradient.cpp
        ./src/gui/linear_gradient.cpp
        ./src/gui/radial_gradient.cpp
        ./src/gui/conical_gradient.cpp


)

set (MOC_INC_DIR 
        ./includes/core/timer.h
        ./includes/core/cj_object.h
        ./includes/gui/validator.h
        ./includes/gui/paint_device.h
        ./includes/gui/standard_item_model.h
        ./includes/gui/gui_application.h
        ./includes/gui/screen.h
        ./includes/widgets/dialog.h
        ./includes/widgets/dialog_button_box.h
        ./includes/widgets/table_view.h
        ./includes/widgets/grid_layout.h
        ./includes/widgets/application.h
        ./includes/widgets/menu.h
        ./includes/widgets/menu_bar.h
        ./includes/widgets/main_window.h
        ./includes/widgets/tool_bar.h
        ./includes/widgets/push_button.h
        ./includes/widgets/widget.h
        ./includes/widgets/text_edit.h
        ./includes/widgets/status_bar.h
        ./includes/widgets/line_edit.h
        ./includes/widgets/frame.h
        ./includes/widgets/abstract_scroll_area.h
        ./includes/widgets/abstract_slider.h
        ./includes/widgets/scroll_bar.h
        ./includes/widgets/graphics_scene.h
        ./includes/widgets/graphics_view.h
        ./includes/widgets/graphics_item.h
        ./includes/widgets/abstract_graphics_shape_item.h
        ./includes/widgets/tab_bar.h
        ./includes/widgets/tab_widget.h
        ./includes/widgets/splitter.h
        ./includes/widgets/splitter_handle.h
        ./includes/widgets/scroll_area.h
        ./includes/widgets/list_view.h
        ./includes/widgets/dock_widget.h
        ./includes/widgets/tree_view.h
        ./includes/widgets/mdi_area.h
)

find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED )

include_directories(${INC_DIR})
link_directories(${INC_DIR})

qt5_wrap_cpp(MOC_SRC  ${MOC_INC_DIR})

add_library(nativeQt SHARED ${MOC_SRC} ${SRC_DIR})

target_link_libraries(nativeQt PRIVATE Qt5::Core Qt5::Gui Qt5::Widgets)

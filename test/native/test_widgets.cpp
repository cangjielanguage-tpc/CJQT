/*
 * CJQT native layer unit tests: QtWidgets classes
 */
#include <QRectF>
#include "test_harness.h"

extern "C"
{
    void nativeApplicationInit();
    void nativeApplicationDelete();
    bool nativeApplicationIsCreate();

    uintptr_t nativeWidgetCreate(uintptr_t parentPtr);
    void nativeWidgetDelete(uintptr_t ptr);
    void nativeWidgetResize(uintptr_t ptr, int w, int h);
    void nativeWidgetSetFixedSize(uintptr_t ptr, int w, int h);
    void nativeWidgetShow(uintptr_t ptr);
    void nativeWidgetHide(uintptr_t ptr);
    bool nativeWidgetIsVisible(uintptr_t ptr);
    void nativeWidgetMove(uintptr_t ptr, int ax, int ay);
    int nativeWidgetX(uintptr_t ptr);
    int nativeWidgetY(uintptr_t ptr);
    int nativeWidgetWidth(uintptr_t ptr);
    int nativeWidgetHeight(uintptr_t ptr);
    void nativeWidgetSetWindowTitle(uintptr_t ptr, const char *title);
    const char *nativeWidgetWindowTitle(uintptr_t ptr);
    void nativeWidgetSetToolTip(uintptr_t ptr, const char *tip);
    const char *nativeWidgetToolTip(uintptr_t ptr);

    uintptr_t nativeLabelCreate(uintptr_t parentPtr);
    uintptr_t nativeLabelCreateText(const char *text, uintptr_t parentPtr);
    void nativeLabelDelete(uintptr_t ptr);
    void nativeLabelSetText(uintptr_t ptr, const char *text);

    uintptr_t nativeLineEditCreate(uintptr_t parentPtr);
    void nativeLineEditDelete(uintptr_t ptr);
    void nativeLineEditSetText(uintptr_t ptr, const char *ch);
    char *nativeLineEditText(uintptr_t ptr);
    void nativeLineEditSetPlaceholderText(uintptr_t ptr, const char *text);
    char *nativeLineEditPlaceholderText(uintptr_t ptr);
    void nativeLineEditSetReadOnly(uintptr_t ptr, bool b);
    bool nativeLineEditIsReadOnly(uintptr_t ptr);
    void nativeLineEditSetMaxLength(uintptr_t ptr, int length);
    int nativeLineEditMaxLength(uintptr_t ptr);
    void nativeLineEditClear(uintptr_t ptr);

    uintptr_t nativePushButtonCreate(uintptr_t parentPtr);
    void nativePushButtonDelete(uintptr_t ptr);
    void nativePushButtonSetText(uintptr_t ptr, const char *text);

    uintptr_t nativeCheckBoxCreate(uintptr_t parentPtr);
    void nativeCheckBoxDelete(uintptr_t ptr);
    void nativeCheckBoxSetText(uintptr_t ptr, const char *text);
    const char *nativeCheckBoxText(uintptr_t ptr);
    void nativeCheckBoxSetChecked(uintptr_t ptr, bool checked);
    bool nativeCheckBoxIsChecked(uintptr_t ptr);

    uintptr_t nativeTabWidgetCreate(uintptr_t parentPtr);
    void nativeTabWidgetDelete(uintptr_t ptr);
    void nativeTabWidgetAddTab(uintptr_t ptr, uintptr_t widgetPtr, const char *text);
    int nativeTabWidgetCount(uintptr_t ptr);
    int nativeTabWidgetCurrentIndex(uintptr_t ptr);
    void nativeTabWidgetSetTabText(uintptr_t ptr, int index, const char *text);
    const char *nativeTabWidgetTabText(uintptr_t ptr, int index);
    uintptr_t nativeTabWidgetWidget(uintptr_t ptr, int index);
    uintptr_t nativeTabWidgetCurrentWidget(uintptr_t ptr);

    uintptr_t nativeTabBarCreate(uintptr_t parentPtr);
    void nativeTabBarDelete(uintptr_t ptr);
    void nativeTabBarAddTab(uintptr_t ptr, const char *text);
    int nativeTabBarCount(uintptr_t ptr);
    void nativeTabBarSetTabText(uintptr_t ptr, int index, const char *text);
    const char *nativeTabBarTabText(uintptr_t ptr, int index);
    void nativeTabBarRemoveTab(uintptr_t ptr, int index);

    uintptr_t nativeSplitterCreate(uintptr_t parentPtr);
    void nativeSplitterDelete(uintptr_t ptr);
    void nativeSplitterAddWidget(uintptr_t ptr, uintptr_t widgetPtr);
    int nativeSplitterCount(uintptr_t ptr);
    uintptr_t nativeSplitterWidget(uintptr_t ptr, int index);

    uintptr_t nativeStatusBarCreate(uintptr_t parentPtr);
    void nativeStatusBarDelete(uintptr_t ptr);
    void nativeStatusBarShowMessage(uintptr_t ptr, const char *message, int timeout);
    const char *nativeStatusBarCurrentMessage(uintptr_t ptr);
    void nativeStatusBarClearMessage(uintptr_t ptr);

    uintptr_t nativeMenuCreate(uintptr_t parentPtr);
    void nativeMenuDelete(uintptr_t ptr);
    uintptr_t nativeMenuAddAction(uintptr_t ptr, const char *action);
    void nativeMenuSetTitle(uintptr_t ptr, const char *title);

    uintptr_t nativeFrameCreate(uintptr_t parentPtr, unsigned int f);
    void nativeFrameDelete(uintptr_t ptr);
    void nativeFrameSetFrameShape(uintptr_t ptr, short shape);
    short nativeFrameFrameShape(uintptr_t ptr);
    void nativeFrameSetLineWidth(uintptr_t ptr, int width);
    int nativeFrameLineWidth(uintptr_t ptr);

    uintptr_t nativeGroupBoxCreate(uintptr_t parentPtr);
    void nativeGroupBoxDelete(uintptr_t ptr);
    void nativeGroupBoxSetTitle(uintptr_t ptr, const char *title);
    const char *nativeGroupBoxTitle(uintptr_t ptr);
    void nativeGroupBoxSetCheckable(uintptr_t ptr, bool checkable);
    bool nativeGroupBoxIsCheckable(uintptr_t ptr);
    void nativeGroupBoxSetChecked(uintptr_t ptr, bool checked);
    bool nativeGroupBoxIsChecked(uintptr_t ptr);

    uintptr_t nativeScrollBarCreate(uintptr_t parentPtr);
    void nativeScrollBarDelete(uintptr_t ptr);

    uintptr_t nativeTextEditCreate(uintptr_t parentPtr);
    void nativeTextEditDelete(uintptr_t ptr);
    void nativeTextEditSetPlainText(uintptr_t ptr, const char *plainText);
    const char *nativeTextEditToPlainText(uintptr_t ptr);
    void nativeTextEditSetReadOnly(uintptr_t ptr, bool b);
    bool nativeTextEditIsReadOnly(uintptr_t ptr);

    uintptr_t nativeActionCreate(uintptr_t parentPtr);
    void nativeActionDelete(uintptr_t ptr);
    void nativeActionSetText(uintptr_t ptr, const char *text);
    const char *nativeActionText(uintptr_t ptr);
    void nativeActionSetCheckable(uintptr_t ptr, bool checkable);
    bool nativeActionIsCheckable(uintptr_t ptr);
    void nativeActionSetChecked(uintptr_t ptr, bool checked);
    bool nativeActionIsChecked(uintptr_t ptr);

    uintptr_t nativeMainWindowCreate(uintptr_t parentPtr);
    void nativeMainWindowDelete(uintptr_t ptr);
    void nativeMainWindowSetCentralWidget(uintptr_t ptr, uintptr_t widgetPtr);

    uintptr_t nativeBoxLayoutCreate(uintptr_t parentPtr);
    void nativeBoxLayoutDelete(uintptr_t ptr);
    void nativeBoxLayoutAddWidget(uintptr_t ptr, uintptr_t widgetPtr);

    uintptr_t nativeGridLayoutCreate(uintptr_t parentPtr);
    void nativeGridLayoutDelete(uintptr_t ptr);
    void nativeGridLayoutAddWidget(uintptr_t ptr, uintptr_t widgetPtr);
    void nativeGridLayoutAddWidgetWithNum(uintptr_t ptr, uintptr_t widgetPtr, int row, int column);

    uintptr_t nativeGraphicsSceneCreate(double x, double y, double width, double heigh, uintptr_t parentPtr);
    void nativeGraphicsSceneDelete(uintptr_t ptr);
    void nativeGraphicsSceneSetScenRect(uintptr_t ptr, double x, double y, double w, double h);
    QRectF nativeGraphicsSceneScenRect(uintptr_t ptr);
    void nativeGraphicsSceneAddItem(uintptr_t ptr, uintptr_t itemPtr);

    uintptr_t nativeGraphicsViewCreate(uintptr_t parentPtr);
    void nativeGraphicsViewDelete(uintptr_t ptr);
    void nativeGraphicsViewSetScene(uintptr_t ptr, uintptr_t scenePtr);
    uintptr_t nativeGraphicsViewScene(uintptr_t ptr);

    uintptr_t nativeGraphicsLineItemCreate(double x1, double y1, double x2, double y2, uintptr_t parentPtr);
    void nativeGraphicsLineItemDelete(uintptr_t ptr);
    void nativeGraphicsLineItemSetLine(uintptr_t ptr, double x1, double y1, double x2, double y2);
}

void run_widgets_tests()
{
    TEST_MODULE_BEGIN("widgets");

    // QWidget
    {
        uintptr_t w = nativeWidgetCreate(0);
        CHECK(w != 0);
        nativeWidgetSetWindowTitle(w, "unit test");
        CHECK_EQ_STR(nativeWidgetWindowTitle(w), "unit test");
        nativeWidgetResize(w, 320, 240);
        CHECK_EQ_INT(nativeWidgetWidth(w), 320);
        CHECK_EQ_INT(nativeWidgetHeight(w), 240);
        nativeWidgetSetFixedSize(w, 200, 120);
        CHECK_EQ_INT(nativeWidgetWidth(w), 200);
        nativeWidgetSetToolTip(w, "tip");
        CHECK_EQ_STR(nativeWidgetToolTip(w), "tip");
        nativeWidgetMove(w, 10, 20);
        CHECK_EQ_INT(nativeWidgetX(w), 10);
        CHECK_EQ_INT(nativeWidgetY(w), 20);
        nativeWidgetShow(w);
        CHECK(nativeWidgetIsVisible(w));
        nativeWidgetHide(w);
        CHECK(!nativeWidgetIsVisible(w));
        nativeWidgetDelete(w);
    }

    // QLabel
    {
        uintptr_t label = nativeLabelCreateText("hello", 0);
        CHECK(label != 0);
        nativeLabelSetText(label, "world");
        nativeLabelDelete(label);
        CHECK(true);
    }

    // QLineEdit
    {
        uintptr_t edit = nativeLineEditCreate(0);
        CHECK(edit != 0);
        nativeLineEditSetText(edit, "cjqt");
        CHECK_EQ_STR(nativeLineEditText(edit), "cjqt");
        nativeLineEditSetPlaceholderText(edit, "placeholder");
        CHECK_EQ_STR(nativeLineEditPlaceholderText(edit), "placeholder");
        nativeLineEditSetReadOnly(edit, true);
        CHECK(nativeLineEditIsReadOnly(edit));
        nativeLineEditSetReadOnly(edit, false);
        nativeLineEditSetMaxLength(edit, 10);
        CHECK_EQ_INT(nativeLineEditMaxLength(edit), 10);
        nativeLineEditClear(edit);
        CHECK_EQ_STR(nativeLineEditText(edit), "");
        nativeLineEditDelete(edit);
    }

    // QPushButton
    {
        uintptr_t btn = nativePushButtonCreate(0);
        CHECK(btn != 0);
        nativePushButtonSetText(btn, "click");
        nativePushButtonDelete(btn);
        CHECK(true);
    }

    // QCheckBox
    {
        uintptr_t box = nativeCheckBoxCreate(0);
        CHECK(box != 0);
        CHECK(!nativeCheckBoxIsChecked(box));
        nativeCheckBoxSetChecked(box, true);
        CHECK(nativeCheckBoxIsChecked(box));
        nativeCheckBoxSetText(box, "box");
        CHECK_EQ_STR(nativeCheckBoxText(box), "box");
        nativeCheckBoxDelete(box);
    }

    // QTabWidget
    {
        uintptr_t tabs = nativeTabWidgetCreate(0);
        CHECK(tabs != 0);
        uintptr_t page1 = nativeWidgetCreate(0);
        uintptr_t page2 = nativeWidgetCreate(0);
        nativeTabWidgetAddTab(tabs, page1, "one");
        nativeTabWidgetAddTab(tabs, page2, "two");
        CHECK_EQ_INT(nativeTabWidgetCount(tabs), 2);
        nativeTabWidgetSetTabText(tabs, 0, "first");
        CHECK_EQ_STR(nativeTabWidgetTabText(tabs, 0), "first");
        CHECK_EQ_INT(nativeTabWidgetCurrentIndex(tabs), 0);
        CHECK(nativeTabWidgetWidget(tabs, 0) == page1);
        CHECK(nativeTabWidgetCurrentWidget(tabs) == page1);
        nativeTabWidgetDelete(tabs);
    }

    // QTabBar
    {
        uintptr_t bar = nativeTabBarCreate(0);
        CHECK(bar != 0);
        nativeTabBarAddTab(bar, "one");
        nativeTabBarAddTab(bar, "two");
        CHECK_EQ_INT(nativeTabBarCount(bar), 2);
        nativeTabBarSetTabText(bar, 1, "second");
        CHECK_EQ_STR(nativeTabBarTabText(bar, 1), "second");
        nativeTabBarRemoveTab(bar, 0);
        CHECK_EQ_INT(nativeTabBarCount(bar), 1);
        nativeTabBarDelete(bar);
    }

    // QSplitter
    {
        uintptr_t sp = nativeSplitterCreate(0);
        CHECK(sp != 0);
        uintptr_t w1 = nativeWidgetCreate(0);
        uintptr_t w2 = nativeWidgetCreate(0);
        nativeSplitterAddWidget(sp, w1);
        nativeSplitterAddWidget(sp, w2);
        CHECK_EQ_INT(nativeSplitterCount(sp), 2);
        CHECK(nativeSplitterWidget(sp, 0) == w1);
        nativeSplitterDelete(sp);
    }

    // QStatusBar
    {
        uintptr_t bar = nativeStatusBarCreate(0);
        CHECK(bar != 0);
        nativeStatusBarShowMessage(bar, "ready", 0);
        CHECK_EQ_STR(nativeStatusBarCurrentMessage(bar), "ready");
        nativeStatusBarClearMessage(bar);
        nativeStatusBarDelete(bar);
    }

    // QMenu
    {
        uintptr_t menu = nativeMenuCreate(0);
        CHECK(menu != 0);
        nativeMenuSetTitle(menu, "file");
        uintptr_t action = nativeMenuAddAction(menu, "open");
        CHECK(action != 0);
        nativeMenuDelete(menu);
    }

    // QFrame
    {
        uintptr_t frame = nativeFrameCreate(0, 0);
        CHECK(frame != 0);
        nativeFrameSetFrameShape(frame, 6); // QFrame::Box
        CHECK_EQ_INT(nativeFrameFrameShape(frame), 6);
        nativeFrameSetLineWidth(frame, 2);
        CHECK_EQ_INT(nativeFrameLineWidth(frame), 2);
        nativeFrameDelete(frame);
    }

    // QGroupBox
    {
        uintptr_t box = nativeGroupBoxCreate(0);
        CHECK(box != 0);
        nativeGroupBoxSetTitle(box, "group");
        CHECK_EQ_STR(nativeGroupBoxTitle(box), "group");
        nativeGroupBoxSetCheckable(box, true);
        CHECK(nativeGroupBoxIsCheckable(box));
        nativeGroupBoxSetChecked(box, true);
        CHECK(nativeGroupBoxIsChecked(box));
        nativeGroupBoxDelete(box);
    }

    // QScrollBar
    {
        uintptr_t bar = nativeScrollBarCreate(0);
        CHECK(bar != 0);
        nativeScrollBarDelete(bar);
        CHECK(true);
    }

    // QTextEdit
    {
        uintptr_t edit = nativeTextEditCreate(0);
        CHECK(edit != 0);
        nativeTextEditSetPlainText(edit, "hello");
        CHECK_EQ_STR(nativeTextEditToPlainText(edit), "hello");
        nativeTextEditSetReadOnly(edit, true);
        CHECK(nativeTextEditIsReadOnly(edit));
        nativeTextEditDelete(edit);
    }

    // QAction
    {
        uintptr_t action = nativeActionCreate(0);
        CHECK(action != 0);
        nativeActionSetText(action, "save");
        CHECK_EQ_STR(nativeActionText(action), "save");
        nativeActionSetCheckable(action, true);
        CHECK(nativeActionIsCheckable(action));
        nativeActionSetChecked(action, true);
        CHECK(nativeActionIsChecked(action));
        nativeActionDelete(action);
    }

    // QMainWindow
    {
        uintptr_t win = nativeMainWindowCreate(0);
        CHECK(win != 0);
        uintptr_t central = nativeWidgetCreate(0);
        nativeMainWindowSetCentralWidget(win, central);
        nativeMainWindowDelete(win);
    }

    // Layouts
    {
        uintptr_t layout = nativeBoxLayoutCreate(0);
        CHECK(layout != 0);
        uintptr_t btn = nativePushButtonCreate(0);
        nativeBoxLayoutAddWidget(layout, btn);
        nativeBoxLayoutDelete(layout);

        uintptr_t grid = nativeGridLayoutCreate(0);
        CHECK(grid != 0);
        nativeGridLayoutAddWidget(grid, btn);
        nativeGridLayoutAddWidgetWithNum(grid, btn, 0, 0);
        nativeGridLayoutDelete(grid);
    }

    // QGraphicsScene / View / Item
    {
        uintptr_t scene = nativeGraphicsSceneCreate(0, 0, 100, 100, 0);
        CHECK(scene != 0);
        nativeGraphicsSceneSetScenRect(scene, 0, 0, 100, 100);
        QRectF rect = nativeGraphicsSceneScenRect(scene);
        CHECK_EQ_INT((int)rect.width(), 100);
        CHECK_EQ_INT((int)rect.height(), 100);
        uintptr_t item = nativeGraphicsLineItemCreate(0, 0, 10, 10, 0);
        CHECK(item != 0);
        nativeGraphicsLineItemSetLine(item, 0, 0, 20, 20);
        nativeGraphicsSceneAddItem(scene, item);
        nativeGraphicsLineItemDelete(item);
        nativeGraphicsSceneDelete(scene);

        uintptr_t view = nativeGraphicsViewCreate(0);
        CHECK(view != 0);
        uintptr_t scene2 = nativeGraphicsSceneCreate(0, 0, 50, 50, 0);
        nativeGraphicsViewSetScene(view, scene2);
        CHECK(nativeGraphicsViewScene(view) == scene2);
        nativeGraphicsViewDelete(view);
        nativeGraphicsSceneDelete(scene2);
    }

    TEST_MODULE_END("widgets");
}

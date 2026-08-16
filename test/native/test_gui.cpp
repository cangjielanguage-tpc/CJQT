/*
 * CJQT native layer unit tests: QtGui classes
 */
#include "test_harness.h"

extern "C"
{
    uintptr_t nativeColorCreate(int r, int g, int b, int a);

    uintptr_t nativeFontCreate(uintptr_t fontPtr);
    uintptr_t nativeFontCreateFPWI(const char *family, int pointSize, int weight, bool italic);
    void nativeFontDelete(uintptr_t ptr);
    void nativeFontSetFamily(uintptr_t ptr, const char *family);
    void nativeFontSetItalic(uintptr_t ptr, bool italic);
    void nativeFontSetPointSize(uintptr_t ptr, int size);
    void nativeFontSetWeight(uintptr_t ptr, int weight);

    uintptr_t nativeIconCreate();
    uintptr_t nativeIconCreateWithFileName(const char *fileName);
    void nativeIconDelete(uintptr_t ptr);
    bool nativeIconIsNull(uintptr_t ptr);
    const char *nativeIconGetName(uintptr_t ptr);

    uintptr_t nativePaletteCreateForColor(uintptr_t colorPtr);
    void nativePaletteDelete(uintptr_t ptr);

    uintptr_t nativePenCreateArgb(uintptr_t colorPtr, double width);
    uintptr_t nativePenCreate();
    void nativePenDelete(uintptr_t ptr);
    unsigned int nativePenColor(uintptr_t ptr);
    void nativePenSetWidth(uintptr_t ptr, int width);
    void nativePenSetWidthF(uintptr_t ptr, double width);
    void nativePenSetColor(uintptr_t ptr, uintptr_t colorPtr);

    uintptr_t nativeBrushCreate(uintptr_t colorPtr);
    void nativeBrushDelete(uintptr_t ptr);
    unsigned int nativeBrushColor(uintptr_t ptr);
    void nativeBrushSetColor(uintptr_t ptr, uintptr_t colorPtr);

    uintptr_t nativePixmapCreateWithWH(int w, int h);
    void nativePixmapDelete(uintptr_t ptr);
    int nativePixmapGetWidth(uintptr_t ptr);
    int nativePixmapGetHeight(uintptr_t ptr);
    void nativePixmapFill(uintptr_t ptr, unsigned int colorPtr);

    uintptr_t nativeStandardItemModelCreateRC(int rows, int columns, uintptr_t parentPtr);
    uintptr_t nativeStandardItemModelCreate(uintptr_t parentPtr);
    void nativeStandardItemModelDelete(uintptr_t ptr);
    void nativeStandardItemModelSetItem(uintptr_t ptr, int row, int column, uintptr_t itemPtr);
    void nativeStandardItemModelRemoveRow(uintptr_t ptr, int row);

    uintptr_t nativeStandardItemCreate();
    void nativeStandardItemDelete(uintptr_t ptr);

    uintptr_t nativeDoubleValidatorCreate(uintptr_t parentPtr);
    void nativeDoubleValidatorDelete(uintptr_t ptr);
    void nativeDoubleValidatorSetRange(uintptr_t ptr, double minimum, double maximum, int decimals);
    void nativeDoubleValidatorSetDecimals(uintptr_t ptr, int decimals);
    double nativeDoubleValidatorBottom(uintptr_t ptr);
    double nativeDoubleValidatorTop(uintptr_t ptr);
    int nativeDoubleValidatorDecimals(uintptr_t ptr);
    int nativeDoubleValidatorValidate(uintptr_t ptr, char *input, int pos);

    uintptr_t nativePainterCreateWithDevice(uintptr_t devicePtr);
    void nativePainterDelete(uintptr_t ptr);
    void nativePainterSetPen(uintptr_t ptr, uintptr_t penPtr);
    uintptr_t nativePainterPen(uintptr_t ptr);
    void nativePainterDrawLine(uintptr_t ptr, int x, int y, int x2, int y2);
    void nativePainterDrawRect(uintptr_t ptr, int x, int y, int w, int h);
    void nativePainterSave(uintptr_t ptr);
    void nativePainterRestore(uintptr_t ptr);
}

void run_gui_tests()
{
    TEST_MODULE_BEGIN("gui");

    // QColor
    {
        uintptr_t c = nativeColorCreate(255, 0, 0, 255);
        CHECK(c != 0);
    }

    // QFont
    {
        uintptr_t font = nativeFontCreate(0);
        CHECK(font != 0);
        nativeFontSetFamily(font, "Sans Serif");
        nativeFontSetPointSize(font, 12);
        nativeFontSetWeight(font, 75);
        nativeFontSetItalic(font, true);
        nativeFontDelete(font);

        uintptr_t font2 = nativeFontCreateFPWI("Serif", 10, 400, false);
        CHECK(font2 != 0);
        nativeFontDelete(font2);
    }

    // QIcon
    {
        uintptr_t icon = nativeIconCreate();
        CHECK(icon != 0);
        CHECK(nativeIconIsNull(icon));
        nativeIconDelete(icon);
    }

    // QPalette
    {
        uintptr_t color = nativeColorCreate(128, 128, 128, 255);
        uintptr_t palette = nativePaletteCreateForColor(color);
        CHECK(palette != 0);
        nativePaletteDelete(palette);
    }

    // QPen
    {
        uintptr_t color = nativeColorCreate(255, 0, 0, 255);
        uintptr_t pen = nativePenCreateArgb(color, 2.0);
        CHECK(pen != 0);
        nativePenSetWidth(pen, 3);
        nativePenSetWidthF(pen, 3.5);
        nativePenSetColor(pen, color);
        CHECK(nativePenColor(pen) != 0);
        nativePenDelete(pen);
    }

    // QBrush
    {
        uintptr_t color = nativeColorCreate(0, 255, 0, 255);
        uintptr_t brush = nativeBrushCreate(color);
        CHECK(brush != 0);
        CHECK(nativeBrushColor(brush) != 0);
        uintptr_t color2 = nativeColorCreate(0, 0, 255, 255);
        nativeBrushSetColor(brush, color2);
        nativeBrushDelete(brush);
    }

    // QPixmap
    {
        uintptr_t pixmap = nativePixmapCreateWithWH(100, 80);
        CHECK(pixmap != 0);
        CHECK_EQ_INT(nativePixmapGetWidth(pixmap), 100);
        CHECK_EQ_INT(nativePixmapGetHeight(pixmap), 80);
        nativePixmapFill(pixmap, 0xffffffff);
        nativePixmapDelete(pixmap);
    }

    // QStandardItemModel
    {
        uintptr_t model = nativeStandardItemModelCreateRC(3, 2, 0);
        CHECK(model != 0);
        uintptr_t item = nativeStandardItemCreate();
        CHECK(item != 0);
        nativeStandardItemModelSetItem(model, 0, 0, item);
        nativeStandardItemModelRemoveRow(model, 0);
        nativeStandardItemModelDelete(model);
    }

    // QDoubleValidator
    {
        uintptr_t v = nativeDoubleValidatorCreate(0);
        CHECK(v != 0);
        nativeDoubleValidatorSetRange(v, 0.0, 100.0, 2);
        CHECK_EQ_INT((int)nativeDoubleValidatorBottom(v), 0);
        CHECK_EQ_INT((int)nativeDoubleValidatorTop(v), 100);
        CHECK_EQ_INT(nativeDoubleValidatorDecimals(v), 2);
        nativeDoubleValidatorDelete(v);
    }

    // QPainter on QPixmap
    {
        uintptr_t pixmap = nativePixmapCreateWithWH(200, 200);
        CHECK(pixmap != 0);
        uintptr_t painter = nativePainterCreateWithDevice(pixmap);
        CHECK(painter != 0);
        uintptr_t color = nativeColorCreate(0, 0, 0, 255);
        uintptr_t pen = nativePenCreateArgb(color, 1.0);
        nativePainterSetPen(painter, pen);
        nativePainterDrawLine(painter, 0, 0, 100, 100);
        nativePainterDrawRect(painter, 10, 10, 50, 50);
        nativePainterSave(painter);
        nativePainterRestore(painter);
        nativePainterDelete(painter);
        nativePenDelete(pen);
        nativePixmapDelete(pixmap);
    }

    TEST_MODULE_END("gui");
}

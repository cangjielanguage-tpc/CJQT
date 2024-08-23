package cjqt.widgets

@Test
public class WidgetTest{
    @TestCase
    func appTest (): Unit {
        QApplication.create()
        let widgets = QWidget()
        @Assert(QApplication.isCreate(), true)
        widgets.delete()
        QApplication.delete()
    }
}
package cjqt.qt.widgets

@Test
public class ApplicationTest{
    @TestCase
    func createTest (): Unit {
        QApplication.create()
        @Assert(QApplication.isCreate(), false)
        QApplication.delete()
    }
}
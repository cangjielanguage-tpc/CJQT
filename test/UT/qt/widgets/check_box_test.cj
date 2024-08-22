package cjqt.qt.widgets

@Test
public class CheckBoxTest{
    @TestCase
    func chexkBoxTest (): Unit {
        QApplication.create()
        let chexkBox = QCheckBox()
        chexkBox.setText("test")
        chexkBox.setChecked(true)
        @Assert(chexkBox.text(), "test")
        @Assert(chexkBox.isChecked(), true)
        chexkBox.delete()
        QApplication.delete()
    }
}
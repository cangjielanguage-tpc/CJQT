package qt.widgets

@Test
public class CheckBoxTest{
    @TestCase
    func textTest (): Unit {
        QApplication.create()
        let chexkBox = QCheckBox()
        chexkBox.setText("test")
        @Assert(chexkBox.text(), "test")
        chexkBox.delete()
        QApplication.delete()
    }

    @TestCase
    func checkedTest (): Unit {
        QApplication.create()
        let chexkBox = QCheckBox()
        chexkBox.setChecked(true)
        @Assert(chexkBox.isChecked(), true)
        chexkBox.delete()
        QApplication.delete()
    }
}
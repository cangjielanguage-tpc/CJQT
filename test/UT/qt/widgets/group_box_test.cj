package cjqt.widgets

@Test
public class GroupBoxTest{
    @TestCase
    func groupBoxTest (): Unit {
        QApplication.create()
        let groupBox = QGroupBox()
        groupBox.setTitle("test")
        // groupBox.setAlignment(1)
        groupBox.setFlat(true)
        groupBox.setCheckable(true)
        groupBox.setChecked(true)
        @Assert(groupBox.title(), "test")
        // @Assert(groupBox.alignment(), 1)
        @Assert(groupBox.isFlat(), true)
        @Assert(groupBox.isCheckable(), true)
        @Assert(groupBox.isChecked(), true)
        groupBox.delete()
        QApplication.delete()
    }
}
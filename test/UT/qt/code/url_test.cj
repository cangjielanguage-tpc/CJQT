package qt.core

@Test
public class Mytest{
    @TestCase
    func mytest (): Unit {
        let url = QUrl("./README.md")
        @Assert(url.isValid(), true)
        @Assert(url.toString(), "./README.md")
        url.delete()
    }
}
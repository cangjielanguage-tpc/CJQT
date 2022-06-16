import qt.gui.*
import qt.widgets.*

public class TetrisBox <: QWidget {
    var block = Block() //用来储存Tetris中block的数据

    //用来存储Tetris中box的数据
    var box: ArrayList<ArrayList<Int64>> = ArrayList()

    public init() {
        for (i in 0..Tetris.MAX_X) {
            let arr: ArrayList<Int64> = ArrayList()
            for (j in 0..Tetris.MAX_Y) {
                arr.add(0)
            }
            box.add(arr)
        }

        let w = Tetris.getWidth()
        let h = Tetris.getHeight()
        setFixedSize(w, h)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)
            let pen = QPen(QColor.Black, 0)
            let brush = QBrush(QColor.Black)
            painter.setPen(pen)
            painter.setBrush(brush)

            for (i in 0..Tetris.MAX_X) {
                for (j in 0..Tetris.MAX_Y) {
                    if (box[i][j] == 1) {
                        let x = i * Tetris.WIDTH + i * Tetris.INTERVAL
                        let y = j * Tetris.HEIGHT + j * Tetris.INTERVAL
                        painter.drawRect(x, y, Tetris.WIDTH, Tetris.HEIGHT)
                    }
                }
            }

            for (i in 0..Tetris.COUNT) {
                let x = block.x[i]
                let y = block.y[i]
                let x1 = x * Tetris.WIDTH + x * Tetris.INTERVAL
                let y1 = y * Tetris.HEIGHT + y * Tetris.INTERVAL
                painter.drawRect(x1, y1, Tetris.WIDTH, Tetris.HEIGHT)
            }

            painter.delete()
        }
    }

    public func updateTetris(tetris: Tetris) {
        //更新block
        block = tetris.block

        //更新box
        for (i in 0..Tetris.MAX_X) {
            for (j in 0..Tetris.MAX_Y) {
                box[i][j] = tetris.getBox(i, j)
            }
        }
        repaint()
    }
}

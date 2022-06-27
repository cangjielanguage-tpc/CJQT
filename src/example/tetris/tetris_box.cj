package example.tetris

import qt.gui.*
import qt.widgets.*

public class TetrisBox <: QWidget {
    var block = Block() //用来储存Tetris中block的数据

    //用来存储Tetris中box的数据
    var box: ArrayList<ArrayList<BoxItem>> = ArrayList()

    public init() {
        for (i in 0..Tetris.MAX_X) {
            let arr: ArrayList<BoxItem> = ArrayList()
            for (j in 0..Tetris.MAX_Y) {
                arr.add(BoxItem())
            }
            box.add(arr)
        }

        let w = Tetris.getWidth()
        let h = Tetris.getHeight()
        setFixedSize(w, h)

        //setPalette(QPalette(QColor.LightGray))
        //setAutoFillBackground(true)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)

            painter.setPen(QPen(QColor.Black, 1))
            painter.setBrush(QBrush(QColor.LightGray))

            painter.drawRect(0, 0, Tetris.getWidth() - 2, Tetris.getHeight() - 2)

            painter.setPen(QPen(QColor.White, 0))
            painter.setBrush(QBrush(QColor.White))

            for (i in 0..Tetris.MAX_Y) {
                let y = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(1, y + (Tetris.INTERVAL / 2), Tetris.getWidth() - 4, 0)
            }
            for (i in 0..Tetris.MAX_X) {
                let x = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(x + (Tetris.INTERVAL / 2), 1, 0, Tetris.getHeight() - 4)
            }

            for (i in 0..Tetris.MAX_X) {
                for (j in 0..Tetris.MAX_Y) {
                    if (box[i][j].show) {
                        painter.setPen(QPen(QColor.Gray, 1))
                        painter.setBrush(QBrush(box[i][j].color))
                        let x = i * Tetris.WIDTH + i * Tetris.INTERVAL
                        let y = j * Tetris.HEIGHT + j * Tetris.INTERVAL
                        painter.drawRect(x, y, Tetris.WIDTH, Tetris.HEIGHT)
                    }
                }
            }

            painter.setPen(QPen(QColor.Gray, 1))
            painter.setBrush(QBrush(block.color))

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

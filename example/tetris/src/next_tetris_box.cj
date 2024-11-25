
package tetris
import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

public class NextTetrisBox <: QWidget {
    let RESTX = (Tetris.MAX_X - Tetris.NEXT_MAX_X) / 2 //方块x坐标的转换常数
    let RESTY = 4 //方块y坐标的转换常数

    var nextBlock = Block() //“下一个”方块

    public init() {
        let w = Tetris.getNextWidth()
        let h = Tetris.getNextHeight()
        setFixedSize(w, h)

        //setPalette(QPalette(QColor.LightGray))
        //setAutoFillBackground(true)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)

            painter.setPen(QPen(QColor.Black, 1.0))
            painter.setBrush(QBrush(QColor.LightGray))

            painter.drawRect(0, 0, Tetris.getNextWidth() - 2, Tetris.getNextHeight() - 2)

            painter.setPen(QPen(QColor.White, 0.0))
            painter.setBrush(QBrush(QColor.White))

            for (i in 0..Tetris.NEXT_MAX_Y) {
                let y = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(1, y + (Tetris.INTERVAL / 2), Tetris.getNextWidth() - 4, 0)
            }
            for (i in 0..Tetris.NEXT_MAX_X) {
                let x = (i + 1) * (Tetris.WIDTH + Tetris.INTERVAL) - Tetris.INTERVAL
                painter.drawRect(x + (Tetris.INTERVAL / 2), 1, 0, Tetris.getNextHeight() - 4)
            }

            painter.setPen(QPen(QColor.Gray, 1.0))
            painter.setBrush(QBrush(nextBlock.color))

            for (i in 0..Tetris.COUNT) {
                let x = nextBlock.x[i]
                let y = nextBlock.y[i]
                if (x >= 0 && x < Tetris.NEXT_MAX_X && y >= 0 && y < Tetris.NEXT_MAX_Y) {
                    let x1 = x * Tetris.WIDTH + x * Tetris.INTERVAL
                    let y1 = y * Tetris.HEIGHT + y * Tetris.INTERVAL
                    painter.drawRect(x1, y1, Tetris.WIDTH, Tetris.HEIGHT)
                }
            }
            painter.delete()
        }
    }

    public func updateNextTetris(tetris: Tetris) {
        nextBlock.color = tetris.nextBlock.color
        for (i in 0..Tetris.COUNT) {
            nextBlock.x[i] = tetris.nextBlock.x[i] - RESTX
            nextBlock.y[i] = tetris.nextBlock.y[i] + RESTY
        }

        //重新绘制
        repaint()
    }
}

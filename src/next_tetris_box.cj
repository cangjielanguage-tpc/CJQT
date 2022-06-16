import qt.gui.*
import qt.widgets.*

public class NextTetrisBox <: QWidget {
    let RESTX = (Tetris.MAX_X - Tetris.NEXT_MAX_X) / 2 //方块x坐标的转换常数
    let RESTY = 4 //方块y坐标的转换常数

    var nextBlock = Block() //“下一个”方块

    public init() {
        let w = Tetris.getNextWidth()
        let h = Tetris.getNextHeight()
        resize(w, h)

        setPaintEvent() {
            event =>
            let painter = QPainter(this)
            let pen = QPen(QColor.Black, 0)
            let brush = QBrush(QColor.Black)
            painter.setPen(pen)
            painter.setBrush(brush)

            
            for (i in 0..Tetris.COUNT) {
                let x = nextBlock.x[i]
                let y = nextBlock.y[i]
                let x1 = x * Tetris.WIDTH + x * Tetris.INTERVAL
                let y1 = y * Tetris.HEIGHT + y * Tetris.INTERVAL
                painter.drawRect(x1, y1, Tetris.WIDTH, Tetris.HEIGHT)
            }

            painter.delete()
        }
    }

    public func updateNextTetris(tetris: Tetris) {
        nextBlock = tetris.nextBlock
        for (i in 0..Tetris.COUNT) {
            nextBlock.x[i] -= RESTX
            nextBlock.y[i] += RESTY
        }

        //重新绘制
        repaint();
    }
}

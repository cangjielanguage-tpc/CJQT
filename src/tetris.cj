from std import random.*
from std import math.*
from std import collection.*

public class Tetris {
    static let MAX_X = 10 //显示窗口的横向格数
    static let MAX_Y = 20 //显示窗口的竖向格数
    static let NEXT_MAX_X = 6 //“下一个”显示窗口的横向格数
    static let NEXT_MAX_Y = 6 //“下一个”显示窗口的竖向格数
    static let WIDTH = 30 //单格的宽度
    static let HEIGHT = 30 //单格的高度
    static let INTERVAL = 2 //单格之间的间隔
    static let COUNT = 4 //每个方块的格数

    var score: Int64 = 0 //分数
    var block = Block() //当前方块
    var nextBlock = Block() //下一个方块

    //方格的坐标系 1表示右方格，0表示没有方格
    var box: ArrayList<ArrayList<BoxItem>> = ArrayList()

    let random = Random()

    public init() {
        for (i in 0..MAX_X) {
            let arr: ArrayList<BoxItem> = ArrayList()
            for (j in 0..MAX_Y) {
                arr.add(BoxItem())
            }
            box.add(arr)
        }
        createNextBlock()
    }

    //创建当前方块
    //将上一次生成的下一个方块nextBlock复制给block
    //并创建下一个nextBlock
    public func createBlock() {
        //nextBlock复制给block
        for (i in 0..COUNT) {
            block.x[i] = nextBlock.x[i]
            block.y[i] = nextBlock.y[i]
        }
        block.centerX = nextBlock.centerX
        block.centerY = nextBlock.centerY
        block.id = nextBlock.id
        block.color = nextBlock.color

        //创建下一个nextblock
        createNextBlock()
    }

    //返回坐标（x，y）的值，以判断是否右方格
    public func getBox(x: Int64, y: Int64) {
        return box[x][y]
    }

    //旋转当前方块
    //旋转成功返回true，否则返回false
    public func rotate(): Bool {
        return isRotatable()
    }

    //将当前方块向左移动一格
    //成功返回true，否则返回false
    public func moveToLeft(): Bool {
        return move(-1, 0)
    }

    //将当前方块向右移动一格
    //成功返回true，否则返回false
    public func moveToRight(): Bool {
        return move(1, 0)
    }

    //将方块向下移动一格
    //成功返回true， 游戏结束返回false
    public func moveToBottom(): Bool {
        if (!move(0, 1)) {
            //移动不成功
            blockToBox() //将当前方块复制到box中
            killLines() //消行

            //判断是否结束
            //否则创建新的方块
            if (isEnd()) {
                return false
            } else {
                createBlock()
            }
        }
        return true
    }

    //判断游戏是否结束
    //结束条件为第一行有方格
    public func isEnd(): Bool {
        let j = 0
        for (i in 0..MAX_X) {
            if (box[i][j].show) {
                return true
            }
        }
        return false
    }

    //消掉整行并进行分数奖励
    public func killLines() {
        var count = 0 //一次消掉的行数

        //通过getFirstFullLine()函数获得从上到下第一个整行
        //并将其上的行向下平移一行，达到消行的效果
        var temp = getFirstFullLine()
        while (temp != -1) {
            for (j in temp..0 : -1) {
                for (i in 0..MAX_X) {
                    box[i][j] = box[i][j - 1]
                }
            }
            count++
            temp = getFirstFullLine()
        }

        //消行的分数奖励
        score += count * count * 10
    }

    //对成员变量进行初始化，重新开始游戏
    public func clear() {
        //初始化
        score = 0

        for (i in 0..MAX_X) {
            for (j in 0..MAX_Y) {
                box[i][j].show = false
            }
        }
        for (i in 0..COUNT) {
            block.x[i] = -1
            block.y[i] = -1
        }
        block.centerX = -1
        block.centerY = -1
        block.id = 0

        //创建下一个方块
        createNextBlock()
    }

    //获得游戏窗口的宽度
    static public func getWidth(): Int64 {
        return MAX_X * WIDTH + (MAX_X - 1) * INTERVAL
    }

    //获得游戏窗口的高度
    static public func getHeight(): Int64 {
        return MAX_Y * HEIGHT + (MAX_Y - 1) * INTERVAL
    }

    //获得“下一个”窗口的宽度
    static public func getNextWidth(): Int64 {
        return NEXT_MAX_X * WIDTH + (NEXT_MAX_X - 1) * INTERVAL
    }

    //获得“下一个”窗口的高度
    static public func getNextHeight(): Int64 {
        return NEXT_MAX_Y * WIDTH + (NEXT_MAX_Y - 1) * INTERVAL
    }

    //创建“下一个”方块
    private func createNextBlock() {
        var centerX = (MAX_X - 1) / 2 //中心x坐标
        var id = abs(random.nextInt64() % 7) //获得0 - 6的随机数

        //根据不同的随机数创建方块
        match (id) {
            case 0 =>
                //##
                //##
                nextBlock.x = [centerX, centerX, centerX + 1, centerX + 1]
                nextBlock.y = [-2, -1, -2, -1]
                nextBlock.centerX = 0
                nextBlock.centerY = 0
                nextBlock.id = 0
                nextBlock.color = QColor.Cyan
            case 1 =>
                //####
                //
                nextBlock.x = [centerX - 1, centerX, centerX + 1, centerX + 2]
                nextBlock.y = [-1, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 1
                nextBlock.color = QColor.Blue
            case 2 =>
                //##
                // ##
                nextBlock.x = [centerX - 1, centerX, centerX, centerX + 1]
                nextBlock.y = [-2, -2, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -2
                nextBlock.id = 2
                nextBlock.color = QColor(255, 165, 0, 255)
            case 3 =>
                // ##
                //##
                nextBlock.x = [centerX, centerX + 1, centerX - 1, centerX]
                nextBlock.y = [-2, -2, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -2
                nextBlock.id = 3
                nextBlock.color = QColor.Magenta
            case 4 =>
                //#
                //###
                nextBlock.x = [centerX - 1, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 4
                nextBlock.color = QColor.Green
            case 5 =>
                //  #
                //###
                nextBlock.x = [centerX + 1, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 5
                nextBlock.color = QColor(139, 0, 139, 255)
            case 6 =>
                // #
                //###
                nextBlock.x = [centerX, centerX - 1, centerX, centerX + 1]
                nextBlock.y = [-2, -1, -1, -1]
                nextBlock.centerX = centerX
                nextBlock.centerY = -1
                nextBlock.id = 6
                nextBlock.color = QColor.Red
            case _ => ()
        }
    }

    //可以移动就对block进行变换，返回true
    //否则返回false
    private func move(dx: Int64, dy: Int64): Bool {
        var newX = Array<Int64>(COUNT, item: 0)
        var newY = Array<Int64>(COUNT, item: 0)
        var newCenterX = 0
        var newCenterY = 0
        for (i in 0..COUNT) {
            newX[i] = block.x[i] + dx
            newY[i] = block.y[i] + dy

            //对变换后的坐标进行判定
            
            //x坐标超出范围返回false
            if (newX[i] < 0 || newX[i] >= MAX_X) {
                return false
            }

            //y坐标在0 - MAXY之间就对box中的状态进行判定
            //box中为1则返回false
            if (newY[i] >= 0 && newY[i] < MAX_Y) {
                if (box[newX[i]][newY[i]].show) {
                    return false
                }
            } else if (newY[i] >= MAX_Y) {
                //y坐标超出最大值返回false
                return false
            }
        }

        newCenterX = block.centerX + dx
        newCenterY = block.centerY + dy

        //满足条件就将新的x和y坐标赋值给block
        for (i in 0..COUNT) {
            block.x[i] = newX[i]
            block.y[i] = newY[i]
        }
        block.centerX = newCenterX
        block.centerY = newCenterY

        return true
    }

    //可以旋转就对block进行变换，返回true
    //否则返回false
    private func isRotatable(): Bool {
        var newX = Array<Int64>(COUNT, item: 0)
        var newY = Array<Int64>(COUNT, item: 0)
        var newCenterX = 0
        var newCenterY = 0

        if (block.id == 0) {
            return false
        }

        for (i in 0..COUNT) {
            let nx = block.x[i] - block.centerX
            let ny = block.y[i] - block.centerY
            newX[i] = nx * 0 + ny * (-1) + block.centerX
            newY[i] = nx * 1 + ny * 0 + block.centerY

            //对变换后的坐标进行判定
            
            //x坐标超出范围返回false
            if (newX[i] < 0 || newX[i] >= MAX_X) {
                return false
            }

            //y坐标在0 - MAXY 之间就对box中的状态进行判定
            //box中为1则返回false
            if (newY[i] >= 0 && newY[i] < MAX_Y) {
                if (box[newX[i]][newY[i]].show) {
                    return false
                }
            } else if (newY[i] >= MAX_Y) {
                //y坐标超过最大值返回false
                return false
            }
        }
        newCenterX = block.centerX
        newCenterY = block.centerY

        //满足条件后进行block的赋值
        for (i in 0..COUNT) {
            block.x[i] = newX[i]
            block.y[i] = newY[i]
        }
        block.centerX = newCenterX
        block.centerY = newCenterY

        return true
    }

    //将block中数据复制到box中
    private func blockToBox() {
        for (i in 0..COUNT) {
            let x = block.x[i]
            let y = block.y[i]
            if (y >= 0) {
                box[x][y].show = true
                box[x][y].color = block.color
            }
        }
    }

    //获得第一个整行的行数，并返回
    private func getFirstFullLine(): Int64 {
        //这里j从1开始就好
        for (j in 0..MAX_Y) {
            var judgement = true
            for (i in 0..MAX_X) {
                if (!box[i][j].show) {
                    judgement = false
                    break
                }
            }
            if (judgement) {
                return j
            }
        }
        return -1
    }
}

public record Block {
    public var x = Array<Int64>(Tetris.COUNT, item: -1) //方块单格的x坐标
    public var y = Array<Int64>(Tetris.COUNT, item: -1) //方块单格的y坐标
    public var centerX: Int64 = -1 //方块的中心x坐标
    public var centerY: Int64 = -1 //方块的中心y坐标
    public var id: Int64 = 0 //方块的ID
    public var color = QColor.Black //方块的颜色
}

public class BoxItem {
    public var show = false //是否显示方块
    public var color = QColor.Black //方块的颜色
}

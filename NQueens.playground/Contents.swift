import UIKit
/***
 N-Queens Problem
 N x N의 체스보드에 N개의 퀸말을 놓는데, 퀸말들 사이에 얼마나 퀸을 배치할 수 있는가?
 퀸의 공격 범위에 간섭을 받으면 안된다
 - 같은 행, 같은 열, 대각선상에 서로 배치될 수 없다
 */
let size:Int = 5
var xPosition:[Int] = [Int](repeating: Int.min, count: size)
var solutionCount:Int = 0

func batchQueen() -> Bool {
    placeQueen(y: 0)
    return solutionCount > 0
}

func placeQueen(y:Int) {
    if y >= size {
        solutionCount += 1
        xPosition[y-1] = Int.min
        print("====== Sucess =======")
        return
    }

    for x in 0 ... size - 1 {
        print("(\(x), \(y))")
        if canPlaceQueen(destX: x, destY: y) {
            xPosition[y] = x
            print("<< (\(x), \(y))")
            placeQueen(y: y + 1)
        }
    }
    if y >= 1 {
        print("release pos: \(y-1), \(y-1)/ \(xPosition[y-1])")
        xPosition[y-1] = Int.min
    }
}

func canPlaceQueen(destX:Int, destY:Int) -> Bool {
    var xPlaceable = true
    
    //X축 검색
    for iter in xPosition {
        if iter == destX {
            xPlaceable = false
        }
    }
    
    //대각선 검색
    var diagonalPlaceable = true
    var leftDir = destX - 1
    var rightDir = destX + 1
    var yDir = destY - 1
    while yDir >= 0 {
        if xPosition[yDir] == leftDir || xPosition[yDir] == rightDir {
            diagonalPlaceable = false
        }
        leftDir -= 1
        rightDir += 1
        yDir -= 1
    }
    return xPlaceable && diagonalPlaceable
}

var able = batchQueen()
print("batchAble? : \(able)")
print("Solution Count: \(solutionCount)")

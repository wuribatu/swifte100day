//: Playground - noun: a place where people can play

import UIKit

// 结构体总是通过被复制的方式在代码中传递，不使用引用计数。
class someClase {
}

struct someStructure {
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

var vag = Resolution(width: 100, height: 200)
let hd = Resolution(width: 1000, height: 1000)
var hd1 = hd

enum CompassPoint {
    case North, South, East, West
}

var position1 = CompassPoint.North
let position2 = position1
position1 = .East

if position2 == .North {
    print("remember position")
}

let tenEight = VideoMode()
tenEight.resolution = hd
tenEight.interlaced = false
tenEight.frameRate = 2.2
tenEight.name = "hah"

let alsoTenEighty = tenEight
alsoTenEighty.frameRate = 32.2

print("tenEight.frameRate = \(tenEight.frameRate)")

// "==="
// "!=="
// 运用这两个运算符检测两个常量或者变量是否引用同一个实例
if tenEight === alsoTenEighty {
    print("too")
}





















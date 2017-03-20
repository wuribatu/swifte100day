//: Playground - noun: a place where people can play

import UIKit

// 计算属性 可以用于类、结构体和枚举
// 存储属性 只能用于类和结构体。
// 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性。

struct FixedLengthRange {
    var fisValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(fisValue: 0, length: 3)
rangeOfThreeItems.fisValue = 6

// 延迟属性
class DataImporter {
    var filename = "file.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some data hh")
print(manager.importer.filename)

// 计算属性
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
       // 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue 。下面是使用了简化 sett er 声明的 Rect 结构体代码
//        set {
//            origin.x = newValue.x - (size.width/2)
//            origin.y = newValue.y - (size.height/2)
//        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("\(square.origin.x) ...\(square.origin.y)")

// 只读属性
// 只写getter 不写setter方法就是只读属性
// 可以省略get关键字
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

// 父类的属性在子类的构造器中被赋值时，它在父类中的willset和didset观察器会被调用，随后才会调用子类的观察器
// 在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用。
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("new value is \(newValue)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue)")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 11
stepCounter.totalSteps = 22
stepCounter.totalSteps = 100

// 类型属性
struct SomeStruture {
    static var value = "some value"
    static var value2 : Int {
        return 3
    }
}

enum SomeEnumeration {
    static var  value = "some enum"
    static var value1 : Int {
        return 3
    }
}

// 类型属性是通过类型来访问的
print(SomeStruture.value)
SomeStruture.value = "another value"
print(SomeStruture.value)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentValue: Int = 0 {
        didSet {
            if currentValue > AudioChannel.thresholdLevel {
                currentValue = AudioChannel.thresholdLevel
            }
            if currentValue > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentValue
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentValue = 7
print("current\(leftChannel.currentValue) max \(AudioChannel.maxInputLevelForAllChannels)")

rightChannel.currentValue = 11
print("current\(rightChannel.currentValue) max \(AudioChannel.maxInputLevelForAllChannels)")






//: Playground - noun: a place where people can play

import UIKit

class Counter {
    var count = 0
    func increment() -> () {
        count += 1
    }
    
    func increment(by amount: Int) -> () {
        count += amount
    }
    
    func reset() -> () {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x: 1.0) {
    print("right")
}

// 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
// 需要使用mutating关键字才可以修改
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(delaX: Double, y delaY: Double) {
        x += delaX
        y += delaY
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveByX(delaX: 2.0, y: 3.0)
print("somePoint is \(somePoint1.x),\(somePoint1.y)")

// 可变方法能够赋给隐含属性 self 一个全新的实例。上面 Point 的例子可以用下面的方式改写:
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(delaX: Double, y delaY: Double) {
        self = Point2(x: x + delaX, y: y + delaY)
    }
}

// 枚举的可变方法可以把 self 设置为同一枚举类型中不同的成员:

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

// 类型方法在方法的 func 关键字之前加上关键字 static ，来指定类型方法。类还可以用关键字 class 来允许子类重写父类的方法实现。
class SomeClass {
    class func someTypeMethod() {
    
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockLevel {
            highestUnlockLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// 因为允许在调用 advance(to:) 时候忽略返回值，不会产生编译警告

class Player {
    var tracker = LevelTracker()
    let playName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playName = name
    }
}

var player = Player(name: "abc")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockLevel)")

player = Player(name:"dcd")
if  player.tracker.advance(to: 6) {
    print("yes")
} else {
    print("no")
}









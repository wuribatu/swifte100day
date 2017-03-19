//: Playground - noun: a place where people can play

import UIKit

let point = (1, 0)
switch point {
case (let x, 1):
    print("\(x)")
case (2, let y):
    print("\(y)")
case let (x, y):
    print("\(x) \(y)")
}

// wher可以添加额外的判断条件

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("x ==y\(x) \(y)");
case let (x, y) where x == -y:
    print("x == -y \(x) \(y)")
case let (x, y):
    print("x = \(x), y = \(y)")
}

if #available(iOS 10, watchOS 1.0, *) {
    print("cow")
}
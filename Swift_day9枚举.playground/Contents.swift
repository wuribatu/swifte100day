//: Playground - noun: a place where people can play

import UIKit

enum SomeEnumeration {

}

enum CompassPoint {
    case north
    case east
    case west
    case south
}

var directionToHead = CompassPoint.west
print(directionToHead)
directionToHead = .north
print(directionToHead)

//使用 Switch 语句匹配枚举值
switch directionToHead {
    case .north:
    print(directionToHead)
    case .east:
    print(directionToHead)
    case .west:
    print(directionToHead)
    case .south:
    print(directionToHead)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(1, 2, 3, 3)
productBarcode = .qrCode("ABCJDKLSJF")
switch productBarcode {
case .upc(let x, let y, let z, let m):
    print("\(x) \(y) \(z) \(m)")
case .qrCode(let productQRcode):
    print("\(productQRcode)")
}

switch productBarcode {
case let .upc(x, y, z, m):
    print("\(x) \(y) \(z) \(m)")
case let .qrCode(productQRcode):
    print("\(productQRcode)")
}

// 原始值
enum ASCIIControlCharacter : Character {
    case tab = "\t"
    case linefeed = "\n"
    case carriageReturn = "\r"
}

// rawValue 属性可以访问该枚举成员的原始值
let rawValue = ASCIIControlCharacter.tab.rawValue
print(rawValue)

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let possiblePlanet = Planet(rawValue: 7)
let positionToFind = 11
if let somePlanet = Planet(rawValue:11) {
    switch somePlanet {
    case .earth:
        print("earth plant :\(somePlanet)")
    default:
        print("other planet")
    }
} else {
    print("These is not plant \(positionToFind)")
}

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case mutiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print("\(evaluate(product))")



















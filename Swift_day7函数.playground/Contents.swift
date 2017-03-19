//: Playground - noun: a place where people can play

import UIKit

func greet(person: String) -> String {
    let greeting = "hello" + person + "!"
    return greeting
}

print(greet(person: "meizi"))

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: "ha")
    } else {
        return greet(person: person)
    }
}

greet(person: "tutu", alreadyGreeted: false)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[0 ..< array.count] {
        if value > currentMax {
            currentMax = value
        } else if value < currentMin {
            currentMin = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [1, 2, 3, 4, 5, 6, 7, 8]) {
    print("max = \(bounds.max), min = \(bounds.min)")
}

func someFunction(argumentLabel parameter: Int) {
    print(parameter);
}

func greet(person: String, from hometown: String) {
    print("\(person) from \(hometown)")
}

greet(person: "lala", from: "Sussina")

func someFunction(parameter1: Int, parameter2: Int = 12) -> Int {
    return parameter1 + parameter2
}

someFunction(parameter1: 1, parameter2: 2)
someFunction(parameter1: 3)

func arithmeticMean(_ number: Double...) -> Double {
    var total: Double = 0
    for item in number {
        total += item
    }
    return total/Double(number.count)
}

print(arithmeticMean(1.1, 1.1, 1.1))

// 输入输出参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b;
    b = temporaryA
}

var oneInt = 1;
var another = 2;
swapTwoInts(&oneInt, &another)
//print("\(oneInt) \(another)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
//print(mathFunction(1, 1))

mathFunction = multiplyTwoInts
//print(mathFunction(1, 1))

func printMathFunction(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("result \(mathFunction(a, b))")
}

func math (a: Int, b: Int) -> Int {
    return a + b
}

printMathFunction(math, 3, 3)

func setpForward(_ input: Int) -> Int {
    return input + 1
}

func setpBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? setpBackward : setpForward
}

var value = 3
let moveNearerToZero = chooseStepFunction(backward: value > 0)

while value != 0 {
    print("\(value)...")
    value = moveNearerToZero(value)
}
print("zero!")

func func2(back: Bool) -> (Int) -> Int {
    func setpFor(input: Int) -> Int {
        return input + 1
    }
    func setpBack(input: Int) -> Int {
        return input - 1
    }
    return back ? setpBack : setpFor
}

var value1 = -4
let func3 = func2(back: value1 > 0)
while value1 != 0 {
    print("value1 \(value1)...")
    value1 = func3(value1)
}
print("zero!")





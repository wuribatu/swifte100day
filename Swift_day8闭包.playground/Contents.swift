//: Playground - noun: a place where people can play

import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: {s1 , s2 in return s1 > s2})
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
reversedNames = names.sorted(by: {$0 > $1})
reversedNames = names.sorted(by: >)

func someFunctionThatTakesAClosure(closure: ()->Void) {
    
}

// 尾随闭包
someFunctionThatTakesAClosure() {
    
}

// 不适用尾随闭包
someFunctionThatTakesAClosure(closure: {

})

reversedNames = names.sorted(){
    $0 > $1
}

reversedNames = names.sorted {
    $0 > $1
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

// 值捕获
func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer () -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

makeIncrementer(forIncrementer: 3)()

let incrementByTen = makeIncrementer(forIncrementer: 10)
incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrementer: 7)
incrementBySeven()
incrementBySeven()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completion: @escaping () -> Void) {
    completionHandlers.append(completion)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class someClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = someClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

// 自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
customerProvider()
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: {customersInLine.remove(at: 0)})
print(customersInLine.count)

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving\(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
print(customersInLine.count)


// customersInLine i= ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}











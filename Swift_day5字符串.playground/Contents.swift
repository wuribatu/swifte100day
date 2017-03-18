




//: Playground - noun: a place where people can play

import UIKit

let something = "some thing literal value"
var emptyStirng = ""
var antherEmptyString = String()

if emptyStirng.isEmpty {
    print("nothing to see here")
}
var variableString = "horse"
variableString += "+ pig"

for character in variableString.characters {
    print(character)
}

let mark: [Character] = ["h", "a", "h", "a"]
let hahaString = String(mark)

let string1 = "vision"
let string2 = "overseas"
var resultString = string1 + string2
var instruction = "look over"
resultString += instruction
let characterMark = "!"
instruction.append(characterMark)


let mitipiler = 3
let message = "\(mitipiler)times 2.5 is \(Double(mitipiler) * 2.5)"

let greeting = "Guten tag"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]

let index = greeting[greeting.index(greeting.startIndex, offsetBy: 7)]

for indexs in greeting.characters.indices {
    print(indexs)
}

var hello = "hello"
hello.insert("!", at: hello.endIndex)
hello.insert(contentsOf: " there".characters, at: hello.index(before: hello.endIndex))

hello.remove(at: hello.index(before: hello.endIndex))
print(hello)

let range = hello.index(hello.endIndex, offsetBy: -6) ..< hello.endIndex
hello.removeSubrange(range)
print(hello)

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var count = 0
for item in romeoAndJuliet {
    if item.hasPrefix("Act 1") {
        count += 1
    }
}

var someInts = [Int]()
someInts.append(3)
someInts.remove(at: 0)
print(someInts.count)
someInts = []
print(someInts.count)
someInts.removeAll()

let threeDoubles = Array(repeating: 0.0, count: 3)
let anthoerThreeDoubles = Array(repeating: 1.2, count: 3)
var sixDoubles = threeDoubles + anthoerThreeDoubles

var array1 = ["dog", "pig"]
print("thera are \(array1.count) items")
if array1.isEmpty {
    print("this is empty array")
} else {
    print("thera ara \(array1.count) items")
}

array1.append("elephant")
array1 += ["bird"]
array1 += ["man", "woman"]

var firstItme = array1[0]
array1[0] = "cow"
print(array1)

array1[3...5] = ["cat", "chicken"]
print(array1)

array1.insert("oo", at: 0)
array1.remove(at: 0)
array1.removeLast()
print(array1)

for item in array1 {
    print("enum + \(item)")
}

for (index, value) in array1.enumerated() {
    print("item \(String(index)): \(value)")
}

var letters = Set<Character>()

letters.insert("a")
print(letters)
letters = []

var stringSet: Set<String> = ["black", "white", "yellow"]
var string1Set : Set = ["black", "white", "yellow"]

if let removerItem = stringSet.remove("black") {
    print("remove item \(removerItem)")
} else {
    print("do not have the item")
}

if stringSet.contains("yellow") {
    print("have item")
} else {
    print("do have item")
}

















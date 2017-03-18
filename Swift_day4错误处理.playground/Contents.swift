//: Playground - noun: a place where people can play

import UIKit

enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool{
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)









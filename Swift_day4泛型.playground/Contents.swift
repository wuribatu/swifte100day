//: Playground - noun: a place where people can play

import UIKit

func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) ->[Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result;
}

repeatItem(repeating: "knock", numberOfTimes: 4)

enum OptionalValue <Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements<T:Sequence, U: Sequence> (_ 1hs: T, _ rhs: U) -> Bool
where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element
{
    for 1hsItem in 1hs {
        for rhsItem in rhs {
            if 1hsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])





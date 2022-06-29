//
//  NumberInputKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import Foundation

struct NumberInputKeypad: InputKeypad {
    var number: Int

    var title: String { number.description }

    var dimension: (row: UInt8, column: UInt8) { number == 0 ? (1, 2) : (1, 1) }
}

private extension Keypad {
    static func number(_ number: Int) -> NumberInputKeypad {
        NumberInputKeypad(number: number)
    }
}

extension NumberInputKeypad {
    static let zero = number(0)
    static let one = number(1)
    static let two = number(2)
    static let three = number(3)
    static let four = number(4)
    static let five = number(5)
    static let six = number(6)
    static let seven = number(7)
    static let eight = number(8)
    static let nine = number(9)
}

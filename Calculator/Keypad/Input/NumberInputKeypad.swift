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

extension Keypad where Self == NumberInputKeypad {
    static var zero: NumberInputKeypad { NumberInputKeypad(number: 0) }
    static var one: NumberInputKeypad { NumberInputKeypad(number: 1) }
    static var two: NumberInputKeypad { NumberInputKeypad(number: 2) }
    static var three: NumberInputKeypad { NumberInputKeypad(number: 3) }
    static var four: NumberInputKeypad { NumberInputKeypad(number: 4) }
    static var five: NumberInputKeypad { NumberInputKeypad(number: 5) }
    static var six: NumberInputKeypad { NumberInputKeypad(number: 6) }
    static var seven: NumberInputKeypad { NumberInputKeypad(number: 7) }
    static var eight: NumberInputKeypad { NumberInputKeypad(number: 8) }
    static var nine: NumberInputKeypad { NumberInputKeypad(number: 9) }
}

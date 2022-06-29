//
//  DotInputKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import Foundation

struct DotInputKeypad: InputKeypad {
    var title: String { "." }
}

extension Keypad where Self == DotInputKeypad {
    static var dot: DotInputKeypad { DotInputKeypad() }
}

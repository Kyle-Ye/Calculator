//
//  InputKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol InputKeypad: Keypad {}

extension InputKeypad {
    var background: Color { Color(.darkGray) }
}


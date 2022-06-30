//
//  InputKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol InputKeypad: Keypad {}

extension InputKeypad {
    var icon: String? { nil }
    
    var forgroundColor: Color { .primary }
    
    var backgroundColor: Color { Color(.darkGray) }
}


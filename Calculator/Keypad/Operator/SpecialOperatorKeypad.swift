//
//  SpecialOperatorKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/29.
//

import SwiftUI

protocol SpecialOperatorKeypad: OperatorKeypad {}

// MARK: - EqualOperatorKeypad

struct EqualOperatorKeypad: SpecialOperatorKeypad {
    var icon: String? { "equal" }

    var title: String { "Equal" }

    var forgroundStyle: some ShapeStyle { .primary }

    var backgroundStyle: some ShapeStyle { Color.accentColor }
}

extension Keypad where Self == EqualOperatorKeypad {
    static var equal: EqualOperatorKeypad { EqualOperatorKeypad() }
}

// MARK: - AllClearOperatorKeypad

struct AllClearOperatorKeypad: SpecialOperatorKeypad {
    var icon: String? { nil }

    var title: String { "AC" }

    var forgroundStyle: some ShapeStyle { .black }

    var backgroundStyle: some ShapeStyle { Color(uiColor: .lightGray) }
}

extension Keypad where Self == AllClearOperatorKeypad {
    static var allClear: AllClearOperatorKeypad { AllClearOperatorKeypad() }
}

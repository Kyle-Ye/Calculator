//
//  UnaryOperatorKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

// MARK: - UnaryOperator

protocol UnaryOperatorKeypad: OperatorKeypad {
    func operate(_ value: String) -> String
}

extension UnaryOperatorKeypad {
    var forgroundStyle: some ShapeStyle { .black }
    
    var backgroundStyle: some ShapeStyle { Color(uiColor: .lightGray) }
}

// MARK: - ClearOperatorKeypad

struct ClearOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { nil }
    var title: String { "C" }

    func operate(_ value: String) -> String {
        "0"
    }
}

extension Keypad where Self == ClearOperatorKeypad {
    static var clear: ClearOperatorKeypad { ClearOperatorKeypad() }
}

// MARK: - NegateOperatorKeypad

struct NegateOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "plus.forwardslash.minus" }
    var title: String { "Negate" }

    func operate(_ value: String) -> String {
        guard let _ = Double(value) else { return "ERROR" }
        if value.hasPrefix("-") {
            return String(value.dropFirst())
        } else {
            return "-" + value
        }
    }
}

extension Keypad where Self == NegateOperatorKeypad {
    static var negate: NegateOperatorKeypad { NegateOperatorKeypad() }
}

// MARK: - PercentOperatorKeypad

struct PercentOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "percent" }
    var title: String { "Percent" }

    func operate(_ value: String) -> String {
        guard let value = Double(value) else { return "ERROR" }
        return (value / 100).formatted()
    }
}

extension Keypad where Self == PercentOperatorKeypad {
    static var percent: PercentOperatorKeypad { PercentOperatorKeypad() }
}

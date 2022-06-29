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
    var background: Color { Color(uiColor: .lightGray) }
}

// MARK: - ClearOperatorKeypad

struct ClearOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "c" }

    var title: String { "Clear" }

    func operate(_ value: String) -> String {
        "0"
    }
}

extension Keypad where Self == ClearOperatorKeypad {
    static var clear: ClearOperatorKeypad { ClearOperatorKeypad() }
}

// MARK: - AllClearOperatorKeypad

struct AllClearOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "ac" }
    var title: String { "All Clear" }

    func operate(_ value: String) -> String {
        "0"
    }
}

extension Keypad where Self == AllClearOperatorKeypad {
    static var allClear: AllClearOperatorKeypad { AllClearOperatorKeypad() }
}

// MARK: - NegateOperatorKeypad

struct NegateOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "plus.forwardslash.minus" }
    var title: String { "Negate" }

    func operate(_ value: String) -> String {
        guard let value = Double(value) else { return "ERROR" }
        return (-value).formatted()
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

// MARK: - EqualOperatorKeypad

struct EqualOperatorKeypad: UnaryOperatorKeypad {
    var icon: String? { "equal" }
    var title: String { "Equal" }

    func operate(_ value: String) -> String {
        ""
//        guard let value = Double(value) else { return "ERROR" }
//        return (value / 100).formatted()
    }
}

extension Keypad where Self == EqualOperatorKeypad {
    static var equal: EqualOperatorKeypad { EqualOperatorKeypad() }
}
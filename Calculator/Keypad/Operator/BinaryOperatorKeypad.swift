//
//  BinaryOperatorKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol BinaryOperatorKeypad: OperatorKeypad {
    func operate(_ first: String, _ second: String) -> String
}

extension BinaryOperatorKeypad {
    var forgroundColor: Color { .white }

    var backgroundColor: Color { .orange }
}

// MARK: - DivideOperatorKeypad

struct DivideOperatorKeypad: BinaryOperatorKeypad {
    var icon: String? { "divide" }
    var title: String { "Divide" }

    func operate(_ first: String, _ second: String) -> String {
        guard let first = Double(first),
              let second = Double(second)
        else { return "ERROR" }
        return (first / second).formatted()
    }
}

extension Keypad where Self == DivideOperatorKeypad {
    static var divide: DivideOperatorKeypad { DivideOperatorKeypad() }
}

// MARK: - MultiplyOperatorKeypad

struct MultiplyOperatorKeypad: BinaryOperatorKeypad {
    var icon: String? { "multiply" }
    var title: String { "Multiply" }

    func operate(_ first: String, _ second: String) -> String {
        guard let first = Double(first),
              let second = Double(second)
        else { return "ERROR" }
        return (first * second).formatted()
    }
}

extension Keypad where Self == MultiplyOperatorKeypad {
    static var multiply: MultiplyOperatorKeypad { MultiplyOperatorKeypad() }
}

// MARK: - MinusOperatorKeypad

struct MinusOperatorKeypad: BinaryOperatorKeypad {
    var icon: String? { "minus" }
    var title: String { "Minus" }

    func operate(_ first: String, _ second: String) -> String {
        guard let first = Double(first),
              let second = Double(second)
        else { return "ERROR" }
        return (first - second).formatted()
    }
}

extension Keypad where Self == MinusOperatorKeypad {
    static var minus: MinusOperatorKeypad { MinusOperatorKeypad() }
}

// MARK: - PlusOperatorKeypad

struct PlusOperatorKeypad: BinaryOperatorKeypad {
    var icon: String? { "plus" }
    var title: String { "Plus" }

    func operate(_ first: String, _ second: String) -> String {
        guard let first = Double(first),
              let second = Double(second)
        else { return "ERROR" }
        return (first + second).formatted()
    }
}

extension Keypad where Self == PlusOperatorKeypad {
    static var plus: PlusOperatorKeypad { PlusOperatorKeypad() }
}

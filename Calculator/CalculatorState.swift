//
//  GlobalEnv.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import OSLog
import RegexBuilder
import SwiftUI

class CalculatorState: ObservableObject {
    enum State: CustomStringConvertible {
        case value(Int)
        case `operator`(BinaryOperatorKeypad)

        var description: String {
            switch self {
            case .value(let number): return "value(\(number))"
            case .operator(let binaryOperatorKeypad): return "\(type(of: binaryOperatorKeypad))"
            }
        }
    }

    @Published var state: State = .value(0)

    @Published var result: String = "0"

    private var lastBinaryOperatorKeypad: BinaryOperatorKeypad?

    private var lastResult: String = ""

    private let logger = Logger(subsystem: "CalculatorState", category: "state")

    func updateState(for keypad: some Keypad) {
        logger.debug("[Before] state:\(self.state) result: \(self.result) lastResult: \(self.lastResult)")
        logger.debug("Keypad: \(keypad.title)")
        if let keypad = keypad as? NumberInputKeypad {
            numberInput(keypad)
        } else if keypad is DotInputKeypad {
            dotInput()
        } else if let keypad = keypad as? UnaryOperatorKeypad {
            unaryOperator(keypad)
        } else if let keypad = keypad as? BinaryOperatorKeypad {
            binaryOperator(keypad)
        } else if keypad is SpecialOperatorKeypad {
            if keypad is EqualOperatorKeypad {
                equalOperator()
            } else if keypad is AllClearOperatorKeypad {
                allClearOperator()
            }
        }
        logger.debug("[After] state: \(self.state) result: \(self.result) lastResult: \(self.lastResult)")
    }

    private func numberInput(_ keypad: NumberInputKeypad) {
        var buffer = ""
        if case .value = state {
            buffer = result + keypad.number.description
        } else if case .operator(let binaryOperatorKeypad) = state {
            lastResult = result
            buffer = keypad.number.description
            lastBinaryOperatorKeypad = binaryOperatorKeypad
        }
        let hasMinus = buffer.hasPrefix("-")
        if hasMinus {
            buffer.removeFirst()
        }
        buffer = String(buffer.trimmingPrefix("0"))
        if buffer.hasPrefix(".") || buffer.isEmpty { buffer.insert("0", at: buffer.startIndex) }
        if hasMinus { buffer.insert("-", at: buffer.startIndex) }
        result = buffer
        state = .value(keypad.number)
    }

    private func dotInput() {
        if !result.contains(".") {
            result += "."
        }
    }

    private func unaryOperator(_ keypad: UnaryOperatorKeypad) {
        result = keypad.operate(result)
    }

    private func binaryOperator(_ keypad: BinaryOperatorKeypad) {
        if case .value = state,
           let lastBinaryOperatorKeypad,
           !lastResult.isEmpty
        {
            result = lastBinaryOperatorKeypad.operate(lastResult, result)
            self.lastBinaryOperatorKeypad = nil
            lastResult = ""
        }
        state = .operator(keypad)
    }

    private func equalOperator() {
        if let lastBinaryOperatorKeypad, !lastResult.isEmpty {
            result = lastBinaryOperatorKeypad.operate(lastResult, result)
            self.lastBinaryOperatorKeypad = nil
            lastResult = ""
        }
    }

    private func allClearOperator() {
        state = .value(0)
        result = "0"
        lastResult = ""
        lastBinaryOperatorKeypad = nil
    }
}

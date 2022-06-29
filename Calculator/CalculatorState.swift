//
//  GlobalEnv.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

class CalculatorState: ObservableObject {
    enum State {
        case value(Int)
        case `operator`(BinaryOperatorKeypad)
    }

    @Published var state: State = .value(0)

    @Published var result: String = "0"

    private var lastBinaryOperatorKeypad: BinaryOperatorKeypad?

    private var lastResult: String = ""

    func updateState(for keypad: some Keypad) {
        print("[Before] state:\(state) result: \(result) lastResult: \(lastResult)")
        print("Keypad: \(keypad)")
        if let keypad = keypad as? NumberInputKeypad {
            var buffer = ""
            if case .value = state {
                buffer = result + keypad.number.description
            } else if case let .operator(binaryOperatorKeypad) = state {
                lastResult = result
                buffer = keypad.number.description
                lastBinaryOperatorKeypad = binaryOperatorKeypad
            }
            buffer = String(buffer.trimmingPrefix("0"))
            if buffer.hasPrefix(".") || buffer.isEmpty { buffer.insert("0", at: buffer.startIndex) }
            result = buffer
            state = .value(keypad.number)
        } else if keypad is DotInputKeypad {
            if !result.contains(".") {
                result += "."
            }
        } else if let keypad = keypad as? UnaryOperatorKeypad {
            result = keypad.operate(result)
        } else if let keypad = keypad as? BinaryOperatorKeypad {
            if case .value = state,
               let lastBinaryOperatorKeypad,
               !lastResult.isEmpty
            {
                result = lastBinaryOperatorKeypad.operate(lastResult, result)
                self.lastBinaryOperatorKeypad = nil
                lastResult = ""
            }
            state = .operator(keypad)
        } else if keypad is SpecialOperatorKeypad {
            if keypad is EqualOperatorKeypad {
                equalOperator()
            } else if keypad is AllClearOperatorKeypad {
                allClearOperator()
            }
        }
        print("[After] state: \(state) result: \(result) lastResult: \(lastResult)")
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

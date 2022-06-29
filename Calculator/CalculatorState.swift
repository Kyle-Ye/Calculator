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
        case `operator`(OperatorKeypad)
    }

    private var state: State = .value(0)
    @Published var result: String = "0"

    @Published var lastResult: String = ""

    func updateState(for keypad: some Keypad) {
        if let keypad = keypad as? NumberInputKeypad {
            if case .value = state {
                result += keypad.number.description
            } else if case .operator = state {
                lastResult = result
                result = keypad.number.description
            }
            state = .value(keypad.number)
        } else if keypad is DotInputKeypad {
            if !result.contains(".") {
                result += "."
            }
        } else if let keypad = keypad as? UnaryOperatorKeypad {
            result = keypad.operate(result)
        } else if let keypad = keypad as? BinaryOperatorKeypad {
            if !lastResult.isEmpty {
                result = keypad.operate(lastResult, result)
                lastResult = ""
            }
            state = .operator(keypad)
        }
    }
}

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
    @Published var result: Decimal = 0

    func updateState(for keypad: some Keypad) {
        if let keypad = keypad as? NumberInputKeypad {
            state = .value(keypad.number)
            result = Decimal(Double("\(result)\(keypad.number)")!)
        } else if let keypad = keypad as? PointInputKeypad {
            // TODO: Dot mode
            result = Decimal(Double("\(result)\(keypad.title)")!)
        }
    }
}

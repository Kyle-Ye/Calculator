//
//  KeypadView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct KeypadView: View {
    @ObservedObject var calculator: CalculatorState

    var binaryOperatorSelected: Bool {
        if case let .operator(binaryOperatorKeypad) = calculator.state,
           type(of: binaryOperatorKeypad) == type(of: keypad)
        {
            return true
        } else {
            return false
        }
    }

    var keypad: any Keypad

    var body: some View {
        Button {
            calculator.updateState(for: keypad)
        } label: {
            Group {
                if let icon = keypad.icon {
                    Image(systemName: icon)
                } else {
                    Text(keypad.title)
                    Spacer()
                }
            }
            .padding()
        }
        .aspectRatio(keypad.ratio, contentMode: .fill)
        .foregroundColor(binaryOperatorSelected ? keypad.backgroundColor : keypad.forgroundColor)
        .background(binaryOperatorSelected ? keypad.forgroundColor : keypad.backgroundColor)
        .clipShape(Capsule())
        .gridCellColumns(Int(keypad.dimension.column))
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView(calculator: CalculatorState(), keypad: .negate)

        Grid {
            GridRow {
                KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.one)
                KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.two)
                KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.three)
            }
            GridRow {
                KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.zero)
                KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.four)
            }
        }
    }
}

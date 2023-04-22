//
//  KeypadView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct KeypadView: View {
    @ObservedObject var calculator: CalculatorState
    
    @Environment(\.keypadSizeCategory) var keypadSizeCategory

    var binaryOperatorSelected: Bool {
        if case let .operator(binaryOperatorKeypad) = calculator.state,
           type(of: binaryOperatorKeypad) == type(of: keypad) {
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
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .foregroundStyle(binaryOperatorSelected ? AnyShapeStyle(keypad.backgroundStyle) : AnyShapeStyle(keypad.forgroundStyle))
        .buttonStyle(.keypad)
        .background(.tint, in: Capsule())
        .tint(binaryOperatorSelected ? AnyShapeStyle(keypad.forgroundStyle) : AnyShapeStyle(keypad.backgroundStyle))
        .gridCellColumns(Int(keypad.dimension.column))
    }

    private func fontSize(from size: CGSize) -> Double {
        let length = min(size.width, size.height)
        let factor = 1.0
        return length / factor
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        Grid {
            KeypadView(calculator: CalculatorState(), keypad: .negate)
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
        .preferredColorScheme(.dark)
    }
}

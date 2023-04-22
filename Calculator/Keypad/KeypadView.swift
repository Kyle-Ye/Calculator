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
                    Image(systemName: icon).renderingMode(.template)
                } else {
                    Text(keypad.title)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(binaryOperatorSelected ? AnyShapeStyle(keypad.backgroundStyle) : AnyShapeStyle(keypad.forgroundStyle))
        }
        .tint(binaryOperatorSelected ? AnyShapeStyle(keypad.forgroundStyle) : AnyShapeStyle(keypad.backgroundStyle))
        .buttonStyle(.keypad)
        .gridCellColumns(Int(keypad.dimension.column))
    }

    private func fontSize(from size: CGSize) -> Double {
        let length = min(size.width, size.height)
        let factor = 1.0
        return length / factor
    }
}

struct KeypadView_Previews: View, PreviewProvider {
    @StateObject var state = CalculatorState()
    
    var body: some View {
        HStack {
            KeypadView(calculator: state, keypad: NumberInputKeypad.zero)
                .frame(width: 160, height: 80)
            KeypadView(calculator: state, keypad: DotInputKeypad())
                .frame(width: 80, height: 80)
            KeypadView(calculator: state, keypad: EqualOperatorKeypad())
                .frame(width: 80, height: 80)
        }
        .preferredColorScheme(.dark)
    }
    
    static var previews: some View {
        KeypadView_Previews()
    }
}

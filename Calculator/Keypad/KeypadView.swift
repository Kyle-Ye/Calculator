//
//  KeypadView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct KeypadView<K: Keypad>: View {
    @ObservedObject var calculator: CalculatorState

    var keypad: K

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
            .padding(10)
            .foregroundColor(.white)
            .background(keypad.background)
            .clipShape(Capsule())
        }
        .gridCellColumns(Int(keypad.dimension.column))
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.one)
    }
}


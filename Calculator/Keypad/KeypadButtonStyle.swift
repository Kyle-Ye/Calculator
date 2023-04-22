//
//  KeypadButtonStyle.swift
//  Calculator
//
//  Created by Kyle on 2022/6/29.
//

import SwiftUI

struct KeypadButtonStyle: ButtonStyle {
    @State private var isHovered = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.medium)
            .padding()
            .background(.white.opacity((configuration.isPressed || isHovered) ? 0.4 : 0), in: Capsule())
            .background(.tint, in: Capsule())
            .animation(.spring(), value: configuration.isPressed)
            .onHover { isHovered = $0 }
    }
}

extension ButtonStyle where Self == KeypadButtonStyle {
    static var keypad: KeypadButtonStyle { KeypadButtonStyle() }
}

struct KeypadButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            KeypadView(calculator: CalculatorState(), keypad: NumberInputKeypad.one)
                .frame(width: 100, height: 100)
            KeypadView(calculator: CalculatorState(), keypad: PlusOperatorKeypad())
                .frame(width: 100, height: 100)
        }
        .preferredColorScheme(.dark)
    }
}

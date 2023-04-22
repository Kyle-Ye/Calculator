//
//  KeypadButtonStyle.swift
//  Calculator
//
//  Created by Kyle on 2022/6/29.
//

import SwiftUI

struct KeypadButtonStyle: ButtonStyle {
    @State private var isHovered = false
    var shape: AnyShape
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .fontWeight(.medium)
            .padding()
            .background(.white.opacity((configuration.isPressed || isHovered) ? 0.4 : 0), in: shape)
            .background(.tint, in: shape)
            .animation(.spring(), value: configuration.isPressed)
            .onHover { isHovered = $0 }
    }
}

extension ButtonStyle where Self == KeypadButtonStyle {
    static func keypad(shape: some Shape) -> KeypadButtonStyle {
        print(shape)
        return KeypadButtonStyle(shape: AnyShape(shape))
        
    }

}

struct KeypadButtonStyle_Previews: PreviewProvider, View {
    @StateObject var state = CalculatorState()
    
    var body: some View {
        HStack {
            KeypadView(calculator: state, keypad: NumberInputKeypad.one)
                .frame(width: 100, height: 100)
            KeypadView(calculator: state, keypad: PlusOperatorKeypad())
                .frame(width: 100, height: 100)
        }
        .preferredColorScheme(.dark)
    }
    
    static var previews: some View {
        KeypadButtonStyle_Previews()
    }
}

//
//  KeypadButtonStyle.swift
//  Calculator
//
//  Created by Kyle on 2022/6/29.
//

import SwiftUI

struct KeypadButtonStyle: ButtonStyle {

    // TODO
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .animation(.easeInOut(duration: 1), value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.3 : 1.0)
            .padding()
            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == KeypadButtonStyle {
    static var keypad: KeypadButtonStyle { KeypadButtonStyle() }
}

struct KeypadButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("1") {}
            .buttonStyle(.keypad)
    }
}

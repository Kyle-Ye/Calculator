//
//  ContentView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculator = CalculatorState()

    var keypadsLayout: [[any Keypad]] {
        [
            // FIXME: THe AC condition and effect is not accurate
            [calculator.result == "0" ? .allClear : .clear, .negate, .percent, .divide],
            [.seven, .eight, .nine, .multiply],
            [.four, .five, .six, .minus],
            [.one, .two, .three, .plus],
            [.zero, .dot, .equal],
        ]
    }
    
    private var spacing: Double { 12 }

    var body: some View {
        VStack(alignment: .trailing, spacing: spacing) {
            Text(calculator.result)
                .foregroundColor(.primary)
                .font(.system(size: 64))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            Grid(horizontalSpacing: spacing, verticalSpacing: spacing) {
                ForEach(keypadsLayout, id: \.description) { keypads in
                    GridRow {
                        ForEach(keypads, id: \.title) { keypad in
                            KeypadView(calculator: calculator, keypad: keypad.self)
                        }
                    }
                }
            }
        }
        .padding(spacing)
//        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

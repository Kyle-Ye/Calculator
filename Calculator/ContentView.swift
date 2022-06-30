//
//  ContentView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculator = CalculatorState()

    var fullKeypadsLayout: [[any Keypad]] {
        [
            // FIXME: THe AC condition and effect is not accurate
            [.four, .five, .six, .four, .five, .six, calculator.result == "0" ? .allClear : .clear, .negate, .percent, .divide],
            [.four, .five, .six, .four, .five, .six, .seven, .eight, .nine, .multiply],
            [.four, .five, .six, .four, .five, .six, .four, .five, .six, .minus],
            [.four, .five, .six, .four, .five, .six, .one, .two, .three, .plus],
            [.four, .five, .six, .four, .five, .six, .zero, .dot, .equal],
        ]
    }

    private var compactSpacing: Double { 8.0 }

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

    private var spacing: Double { 12.0 }

    var body: some View {
        VStack(alignment: .trailing, spacing: spacing) {
            Text(calculator.result)
                .foregroundColor(.primary)
                .font(.system(size: 96).weight(.light))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.horizontal)

            ViewThatFits {
                Grid(horizontalSpacing: compactSpacing, verticalSpacing: compactSpacing) {
                    ForEach(fullKeypadsLayout, id: \.description) { keypads in
                        GridRow {
                            ForEach(keypads, id: \.title) { keypad in
                                KeypadView(calculator: calculator, keypad: keypad)
                            }
                        }
                    }
                }
                .padding(.horizontal, compactSpacing)
                .environment(\.keypadSizeCategory, .regular)

                Grid(horizontalSpacing: spacing, verticalSpacing: spacing) {
                    ForEach(keypadsLayout, id: \.description) { keypads in
                        GridRow {
                            ForEach(keypads, id: \.title) { keypad in
                                KeypadView(calculator: calculator, keypad: keypad)
                            }
                        }
                    }
                }
                .padding(.horizontal, spacing)
                .padding(.bottom, 20)
                .environment(\.keypadSizeCategory, .compact)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

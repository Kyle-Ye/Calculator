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

    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            Text(calculator.result)
                .foregroundColor(.white)
                .font(.system(size: 64))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            Grid {
                ForEach(keypadsLayout, id: \.description) { keypads in
                    GridRow {
                        ForEach(keypads, id: \.title) { keypad in
                            KeypadView(calculator: calculator, keypad: keypad.self)
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)

//            VStack(spacing: 12) {
//                HStack {
//                    Spacer()
//                    Text(env.display).foregroundColor(.white)
//                        .font(.system(size: 64))
//                }
//                ForEach(buttons, id: \.self) { row in
//                    HStack(spacing: UIScreen.main.bounds.width / 34.5) {
//                        ForEach(row, id: \.self) { button in
//                            Keypad(model: button)
//                        }
//                    }
//                }
//            }.padding(.bottom)
    }

//    var buttonWidth: CGFloat {
//        (UIScreen.main.bounds.width - 5 * 12) / 4
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

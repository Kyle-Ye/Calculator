//
//  ContentView.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculator = CalculatorState()

    let keypads: [any Keypad] = [
        NumberInputKeypad.one, NumberInputKeypad.two, NumberInputKeypad.three, MultipyKeypad()
    ]
//    let buttons: [[KeypadModel]] = [
//        [.unaryOperator("AC"), .unaryOperator("+/-"), .unaryOperator("%"), .binaryOperators("/")],
//        [.number(7), .number(8), .number(9), .binaryOperators("×")],
//        [.number(4), .number(5), .number(6), .binaryOperators("-")],
//        [.number(1), .number(2), .number(3), .binaryOperators("+")],
//        [.number(0), .point, .binaryOperators("=")],
//    ]

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Text(calculator.result.description).foregroundColor(.white)
                    .font(.system(size: 64))
            }
            Grid {
                GridRow {
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.seven)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.eight)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.nine)
                    KeypadView(calculator: calculator, keypad: MultipyKeypad())
                }
                GridRow {
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.four)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.five)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.six)
                }
                GridRow {
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.one)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.two)
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.three)
                }
                GridRow {
                    KeypadView(calculator: calculator, keypad: NumberInputKeypad.zero)
                    KeypadView(calculator: calculator, keypad: PointInputKeypad())
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

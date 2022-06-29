//
//  BinaryOperatorKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol BinaryOperatorKeypad: OperatorKeypad {
    func operate(_ first: Decimal, _ second: Decimal) -> Decimal
}

extension BinaryOperatorKeypad {
    var background: Color { Color(uiColor: .orange) }
}

struct MultipyKeypad: BinaryOperatorKeypad {
    func operate(_ first: Decimal, _ second: Decimal) -> Decimal{
        first * second
    }
    
    var icon: String? { "multiply" }
    var title: String { "multiply" }
}

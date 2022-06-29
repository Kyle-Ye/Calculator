//
//  UnaryOperatorKeypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol UnaryOperatorKeypad: OperatorKeypad {
    func operate(_ value: Decimal) -> Decimal
}

extension UnaryOperatorKeypad {
    var background: Color { Color(uiColor: .lightGray) }
}

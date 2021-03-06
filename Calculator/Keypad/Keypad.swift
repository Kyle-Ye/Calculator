//
//  Keypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol Keypad {
    /// The system icon name of the keypad
    ///  If nil, will use title as a fallback value
    var icon: String? { get }

    /// The localized name for the keypad
    var title: String { get }

    var forgroundColor: Color { get }

    var backgroundColor: Color { get }

    var dimension: (row: UInt8, column: UInt8) { get }
}

extension Keypad {
    var dimension: (row: UInt8, column: UInt8) { (1, 1) }

    var ratio: Double { Double(dimension.row) / Double(dimension.column) }
}

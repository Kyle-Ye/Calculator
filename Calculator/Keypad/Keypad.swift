//
//  Keypad.swift
//  Calculator
//
//  Created by Kyle on 2022/6/28.
//

import SwiftUI

protocol Keypad {
    associatedtype ForgroundStyle: ShapeStyle
    associatedtype BackgroundStyle: ShapeStyle
    
    /// The system icon name of the keypad
    /// If nil, will use title as a fallback value
    var icon: String? { get }

    /// The localized name for the keypad
    var title: String { get }

    var forgroundStyle: ForgroundStyle { get }

    var backgroundStyle: BackgroundStyle { get }

    var dimension: (row: Int, column: Int) { get }
}

extension Keypad {
    var dimension: (row: Int, column: Int) { (1, 1) }
    
    var isCircle: Bool { dimension.row == dimension.column }
}

//
//  KeypadSizeCategory.swift
//  Calculator
//
//  Created by Kyle on 2022/6/30.
//

import SwiftUI

enum KeypadSizeCategory {
    case compact, regular
}


struct KeypadSizeCategoryKey: EnvironmentKey {
    static let defaultValue: KeypadSizeCategory = .compact

}

extension EnvironmentValues {
    var keypadSizeCategory: KeypadSizeCategory {
        get { self[KeypadSizeCategoryKey.self] }
        set { self[KeypadSizeCategoryKey.self] = newValue }
    }
}

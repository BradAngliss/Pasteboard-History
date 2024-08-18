// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public enum Localizable {
    public static func stringFor(key: String) -> String {
        let format = NSLocalizedString(key, tableName: "Localizable", bundle: .main, comment: "")
        return String(format: format, locale: Locale.current)
    }
}

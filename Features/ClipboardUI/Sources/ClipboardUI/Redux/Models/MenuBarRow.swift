//
//  MenuBarRow.swift
//  ClipHistory
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

public struct MenuBarRow {
    let id = UUID()
    let type: MenuBarType
    let data: Data
}

enum MenuBarType {
    case text
    case image
}

public extension MenuBarRow {
    static var arrange: MenuBarRow {
        .init(
            type: .text,
            data: "This is a test row".data(using: .utf8)!
        )
    }
}

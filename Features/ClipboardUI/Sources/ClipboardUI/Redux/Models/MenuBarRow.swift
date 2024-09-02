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
    let type: NSPasteboard.PasteboardType
    let displayData: Data
    let data: Data
    let pasteboardTypes: [NSPasteboard.PasteboardType]
}

public extension MenuBarRow {
    static var arrange: MenuBarRow {
        .init(
            type: .string,
            displayData: .init(),
            data: "This is a test row".data(using: .utf8)!,
            pasteboardTypes: [.string]
        )
    }
}

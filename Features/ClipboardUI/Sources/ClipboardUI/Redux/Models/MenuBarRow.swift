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
    let item: any MenuBarItemProtocol
    
    init(item: MenuBarItemProtocol) {
        self.item = item
    }
}

enum MenuBarType {
    case text
    case image
}

protocol MenuBarItemProtocol {
    var type: MenuBarType { get }
    func saveToPasteboard() -> Void
}

public struct MenuBarImage: MenuBarItemProtocol {
    let type: MenuBarType = .image
    let image: NSImage
    let data: Data

    func saveToPasteboard() {
        return
    }
}

public struct MenuBarText: MenuBarItemProtocol {
    let type: MenuBarType = .text
    let text: String

    func saveToPasteboard() {
//        state.pasteboard.setString(pasteboardText, forType: .string)
        return
    }
}

public extension MenuBarRow {
    static var arrange: MenuBarRow {
        .init(
            item: MenuBarText(text: "This is a test row")
        )
    }
}

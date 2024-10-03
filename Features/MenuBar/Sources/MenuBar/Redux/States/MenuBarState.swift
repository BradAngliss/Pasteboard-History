//
//  MenuBarState.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

struct MenuBarState: Equatable {
    let pasteboard: NSPasteboard

    var items = [PasteboardItem]()
    var lastChangeCount: Int
    var pasteboardLimit: Int

    init(
        lastChangeCount: Int = 0,
        pasteboard: NSPasteboard,
        pasteboardLimit: Int
    ) {
        self.lastChangeCount = lastChangeCount
        self.pasteboard = pasteboard
        self.pasteboardLimit = pasteboardLimit
    }

    func pasteboardItemExists(for pasteboardItem: PasteboardItem) -> Bool {
        return items.contains(where: {
            $0 == pasteboardItem
        })
    }
}

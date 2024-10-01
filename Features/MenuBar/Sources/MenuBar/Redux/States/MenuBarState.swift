//
//  MenuBarState.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

struct MenuBarState: Equatable {
    var items = [PasteboardItem]()
    let pasteboard: NSPasteboard
    
    var lastChangeCount: Int
    
    init(lastChangeCount: Int = 0, pasteboard: NSPasteboard) {
        self.lastChangeCount = lastChangeCount
        self.pasteboard = pasteboard
    }

    func pasteboardItemExists(for pasteboardItem: PasteboardItem) -> Bool {
        return items.contains(where: {
            $0 == pasteboardItem
        })
    }
}

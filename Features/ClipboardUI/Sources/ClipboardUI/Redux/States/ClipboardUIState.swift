//
//  ClipboardUIState.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

struct ClipboardUIState: Equatable {
    var items = [PasteboardItem]()
    let pasteboard = NSPasteboard.general
    
    var lastChangeCount: Int
    
    init(lastChangeCount: Int = 0) {
        self.lastChangeCount = lastChangeCount
    }

    func pasteboardItemExists(for pasteboardItem: PasteboardItem) -> Bool {
        return items.contains(where: {
            $0.pasteboardDataTypes == pasteboardItem.pasteboardDataTypes
        })
    }
}

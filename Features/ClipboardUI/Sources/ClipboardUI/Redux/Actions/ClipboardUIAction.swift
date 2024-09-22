///
//  ClipboardUIAction.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

enum ClipboardUIAction: Equatable {
    case updateChangeCount(changeCount: Int)
    case refreshPasteboardItems
    case copyToPasteboard(PasteboardItem)
    case addPasteboardItems(PasteboardItem)
    case movePasteboardItemToTop(PasteboardItem)

    static func == (lhs: ClipboardUIAction, rhs: ClipboardUIAction) -> Bool {
        switch (lhs, rhs) {
        case (.refreshPasteboardItems, .refreshPasteboardItems):
            return true
        case (.updateChangeCount(let lhsChangeCount), .updateChangeCount(let rhsChangeCount)):
            return lhsChangeCount == rhsChangeCount
        case let (.copyToPasteboard(lhsItem), .copyToPasteboard(rhsItem)):
            return lhsItem == rhsItem
        case let (.addPasteboardItems(lhsItem), .addPasteboardItems(rhsItem)):
            return lhsItem == rhsItem
            
        default:
            return false
        }
    }
}

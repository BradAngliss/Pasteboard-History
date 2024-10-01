///
//  MenuBarAction.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

enum MenuBarAction: Equatable {
    case updateChangeCount(changeCount: Int)
    case refreshPasteboardItems
    case copyToPasteboard(PasteboardItem)
    case addPasteboardItems(PasteboardItem)
    case movePasteboardItemToTop(PasteboardItem)

    static func == (lhs: MenuBarAction, rhs: MenuBarAction) -> Bool {
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

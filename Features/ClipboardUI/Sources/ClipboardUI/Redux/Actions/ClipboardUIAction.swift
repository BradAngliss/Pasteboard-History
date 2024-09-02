///
//  ClipboardUIAction.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation

enum ClipboardUIAction: Equatable {
    case updateChangeCount(changeCount: Int)
    case refreshPasteboardItems
    case addMenuBarRow(MenuBarRow)
    case copyToPasteboard(MenuBarRow)

    static func == (lhs: ClipboardUIAction, rhs: ClipboardUIAction) -> Bool {
        switch (lhs, rhs) {
        case (.refreshPasteboardItems, .refreshPasteboardItems):
            return true
        case (.updateChangeCount(let lhsChangeCount), .updateChangeCount(let rhsChangeCount)):
            return lhsChangeCount == rhsChangeCount
        case (.addMenuBarRow(let lhsMenuBarRow), .addMenuBarRow(let rhsMenuBarRow)):
            return lhsMenuBarRow.id == rhsMenuBarRow.id
        case let (.copyToPasteboard(lhsItem), .copyToPasteboard(rhsItem)):
            return lhsItem.id == rhsItem.id
        default:
            return false
        }
    }
}

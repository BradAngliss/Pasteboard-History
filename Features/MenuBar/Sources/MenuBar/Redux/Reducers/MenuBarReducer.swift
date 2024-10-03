//
//  MenuBarReducer.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI
import Swiftux

let menuBarReducer: Reducer<MenuBarState, MenuBarAction> = { state, action in
    var newState = state
    switch action {

    case .updateChangeCount(let changeCount):
        newState.lastChangeCount = changeCount != state.lastChangeCount ? changeCount : state.lastChangeCount

    case .addPasteboardItems(let pasteboardItem):
        // Check if history limit has been reached and remove last
        if state.items.count >= state.pasteboardLimit && !state.items.isEmpty {
            newState.items.removeFirst()
        }
        newState.items.append(pasteboardItem)

    case .movePasteboardItemToTop(let pasteboardItem):
        guard let index = state.items.firstIndex(of: pasteboardItem) else {
            break
        }
        newState.items.remove(at: index)
        newState.items.append(pasteboardItem)

    case let .updatePasteboardHistoryLimit(newLimit):
        // If new limit is less than current and there are too many items on the pasteboard
        if newLimit < state.pasteboardLimit && state.items.count > newLimit {
            newState.items.removeSubrange(0 ..< state.items.count - newLimit)
        }
        newState.pasteboardLimit = newLimit

    case .refreshPasteboardItems,
            .copyToPasteboard:
        break
    }

    return newState
}

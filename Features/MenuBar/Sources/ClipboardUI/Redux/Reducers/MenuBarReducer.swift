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
        newState.items.append(pasteboardItem)

    case .movePasteboardItemToTop(let pasteboardItem):
        guard let index = state.items.firstIndex(of: pasteboardItem) else {
            break
        }
        newState.items.remove(at: index)
        newState.items.append(pasteboardItem)

    case .refreshPasteboardItems,
            .copyToPasteboard:
        break
    }

    return newState
}

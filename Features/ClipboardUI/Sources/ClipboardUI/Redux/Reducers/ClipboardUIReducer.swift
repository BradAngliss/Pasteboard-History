//
//  ClipboardUIReducer.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI
import Swiftux

let clipboardUIReducer: Reducer<ClipboardUIState, ClipboardUIAction> = { state, action in
    var newState = state
    switch action {
    case .updateChangeCount(let changeCount):
        newState.lastChangeCount = changeCount != state.lastChangeCount ? changeCount : state.lastChangeCount
    case .addMenuBarRow(let menuBarRow):
        newState.pasteboardItems.append(menuBarRow)
    case .refreshPasteboardItems:
        break
    }

    return newState
}

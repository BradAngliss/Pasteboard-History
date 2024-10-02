//
//  PasteboardUIReducer.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI
import Swiftux

let pasteboardUIReducer: Reducer<PasteboardUIState, PasteboardUIAction> = { state, action in
    var newState = state
    switch action {
    case let .setIsMenuBarActive(isActive):
        newState.isMenuBarActive = isActive
    }
    return newState
}

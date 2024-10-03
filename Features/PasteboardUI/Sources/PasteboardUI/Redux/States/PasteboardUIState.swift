//
//  PasteboardUIState.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI

struct PasteboardUIState: Equatable {
    var isMenuBarActive: Bool
    var pasteboardHistory: Int
    
    init(
        isMenuBarActive: Bool,
        pasteboardHistory: Int
    ) {
        self.isMenuBarActive = isMenuBarActive
        self.pasteboardHistory = pasteboardHistory
    }
}

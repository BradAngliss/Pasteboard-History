//
//  ClipboardUIState.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

struct ClipboardUIState {
    var pasteboardItems = [MenuBarRow]()
    let pasteboard = NSPasteboard.general
    
    var lastChangeCount: Int
    
    init(lastChangeCount: Int = 0) {
        self.lastChangeCount = lastChangeCount
    }
}



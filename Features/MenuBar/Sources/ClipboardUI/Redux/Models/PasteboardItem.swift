//
//  File.swift
//  
//
//  Created by Brad Angliss on 06/09/2024.
//

import SwiftUI

struct PasteboardItem: Hashable {
    var availableType: NSPasteboard.PasteboardType
    var pasteboardDataTypes = [NSPasteboard.PasteboardType:Data]()

    func data(forType type: NSPasteboard.PasteboardType) -> Data {
        return pasteboardDataTypes[type]!
    }

    var displayData: Data {
        data(forType: availableType)
    }
}

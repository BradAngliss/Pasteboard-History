//
//  ClipboardUIMiddleware.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import Swiftux
import SwiftUI

let clipboardUIMiddleware: Middleware<ClipboardUIState, ClipboardUIAction> = { state, action in

    switch action {
    case .updateChangeCount,
            .addMenuBarRow:
        break
    case .refreshPasteboardItems:
        if let imageData = state.pasteboard.data(forType: NSPasteboard.PasteboardType.tiff),
            let convertedImage = NSImage(data: imageData) {
                return ClipboardUIAction.addMenuBarRow(.init(image: convertedImage))
        }
        if let pasteboardText = state.pasteboard.string(forType: .string) {
            return ClipboardUIAction.addMenuBarRow(.init(text: pasteboardText))
        }
    case let .copyToPasteboard(item):
        if let pasteboardText = item.text {
//            state.pasteboard.setData(item.text?.data(using: .utf8), forType: .string)
            state.pasteboard.prepareForNewContents()
            state.pasteboard.setString(pasteboardText, forType: .string)
        }
    }
    return nil
}

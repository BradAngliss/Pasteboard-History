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
            return ClipboardUIAction.addMenuBarRow(.init(
                item: MenuBarImage(
                    image: convertedImage,
                    data: imageData
                ))
            )
        }
        if let pasteboardText = state.pasteboard.string(forType: .string) {
            return ClipboardUIAction.addMenuBarRow(.init(item: MenuBarText(text: pasteboardText)))
        }
    case let .copyToPasteboard(row):
        state.pasteboard.prepareForNewContents()

        switch row.item.type {
        case .text:
            state.pasteboard.setString((row.item as! MenuBarText).text, forType: .string)
        case .image:
            let imageData = (row.item as! MenuBarImage).data
            state.pasteboard.setData(Data(imageData), forType: .tiff)
        }
    }
    return nil
}

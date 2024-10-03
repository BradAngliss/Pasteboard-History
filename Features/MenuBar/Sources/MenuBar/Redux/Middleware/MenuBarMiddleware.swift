//
//  ClipboardUIMiddleware.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import Swiftux
import SwiftUI

let menuBarMiddleware: Middleware<MenuBarState, MenuBarAction, MenuBarEnvironmentProtocol> = { state, action, _ in

    switch action {
    case .refreshPasteboardItems:
        // Get available supported types from pasteboard
        guard let pasteboardTypes = state.pasteboard.types,
                let availableType = state.pasteboard.availableType(
                    from: [.URL, .fileURL, .tiff, .png, .string]
                ) else {
            return nil
        }

        // Determine appropriate data type to show
        guard let displayType = state.pasteboard.availableType(from: [.tiff, .png, .string]) else {
            return nil
        }

        var pasteboardItem = PasteboardItem(availableType: displayType)

        for type in pasteboardTypes {
            pasteboardItem.pasteboardDataTypes[type] = state.pasteboard.data(forType: type)
        }

        // Verify item is valid and not currently persisted
        guard pasteboardItem.pasteboardDataTypes.count > 0 else {
            return nil
        }

        // Check if pasteboard item already exists
        guard !state.pasteboardItemExists(for: pasteboardItem) else {
            return .movePasteboardItemToTop(pasteboardItem)
        }
        
        return .addPasteboardItems(pasteboardItem)
        
    case let .copyToPasteboard(pasteboardItem):
        state.pasteboard.prepareForNewContents()

        for (type, data) in pasteboardItem.pasteboardDataTypes {
            switch type {
            case .string, .URL:
                state.pasteboard.setString(String(data: Data(data), encoding: .utf8)!, forType: type)
            case .png, .tiff, .rtf, .rtfd:
                state.pasteboard.setData(Data(data), forType: type)
            case .fileURL:
                let url = URL(dataRepresentation: data, relativeTo: .applicationDirectory, isAbsolute: true)
                state.pasteboard.setData(url?.dataRepresentation, forType: type)
            default:
                break
            }
        }
    case .updateChangeCount,
            .addPasteboardItems,
            .movePasteboardItemToTop,
            .updatePasteboardHistoryLimit:
        break
    }
    return nil
}

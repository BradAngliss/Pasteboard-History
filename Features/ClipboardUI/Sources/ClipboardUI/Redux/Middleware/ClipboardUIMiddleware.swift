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
        if let availablePasteboardType = state.pasteboard.availableType(from: [.fileURL, .tiff, .png, .string]) {
            switch availablePasteboardType {
            case .string:
                guard let pasteboardText = state.pasteboard.string(forType: availablePasteboardType) else {
                    break
                }
                return ClipboardUIAction.addMenuBarRow(.init(
                    type: availablePasteboardType,
                    displayData: pasteboardText.data(using: .utf8)!,
                    data: pasteboardText.data(using: .utf8)!,
                    pasteboardTypes: state.pasteboard.pasteboardItems![0].types
                ))
            case .tiff, .png:
                guard let imageData = state.pasteboard.data(forType: availablePasteboardType) else {
                    break
                }
                return ClipboardUIAction.addMenuBarRow(.init(
                    type: availablePasteboardType,
                    displayData: imageData,
                    data: imageData,
                    pasteboardTypes: state.pasteboard.pasteboardItems![0].types
                ))
            case .fileURL:
                guard let urlData = state.pasteboard.data(forType: availablePasteboardType) else {
                    break
                }
                return ClipboardUIAction.addMenuBarRow(.init(
                    type: availablePasteboardType,
                    displayData: state.pasteboard.data(forType: .tiff)!,
                    data: urlData,
                    pasteboardTypes: state.pasteboard.pasteboardItems![0].types
                ))
                
            default:
                break
            }
        }
        
        
    case let .copyToPasteboard(row):
        state.pasteboard.prepareForNewContents()
        
        for type in row.pasteboardTypes {
            switch row.type {
            case .string:
                state.pasteboard.setString(String(data: row.data, encoding: .utf8)!, forType: type)
            case .png, .tiff:
                state.pasteboard.setData(Data(row.data), forType: type)
            case .fileURL:
                let url = URL(dataRepresentation: row.data, relativeTo: .applicationDirectory, isAbsolute: true)
                state.pasteboard.setData(url?.dataRepresentation, forType: type)
            default:
                break
            }
        }
//        state.pasteboard.addTypes(row.pasteboardTypes, owner: nil)
    }
    return nil
}

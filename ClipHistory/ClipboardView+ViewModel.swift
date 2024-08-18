//
//  ClipHistoryAppViewModel.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import Foundation
import SwiftUI
import AppKit

extension ClipboardView {
    @Observable
    class ViewModel {
        public var pasteboardItems = [RowDataModel]()
        
        private let pasteboard = NSPasteboard.general
        
        private(set) var lastChangeCount: Int
        
        init(lastChangeCount: Int = 0) {
            self.lastChangeCount = lastChangeCount
        }
        
        func updateChangeCount(changeCount: Int) {
            lastChangeCount = changeCount != lastChangeCount ? changeCount : lastChangeCount
        }
        
        func refreshPasteboardItems() -> Void {
//            pasteboardItems.removeAll()
            if let imageData = pasteboard.data(forType: NSPasteboard.PasteboardType.tiff) {
                if let convertedImage = NSImage(data: imageData) {
                    pasteboardItems.append(.init(image: convertedImage))
                }
            }
            if let paste = pasteboard.string(forType: .string) {
                pasteboardItems.append(.init(text: paste))
            }
        }
    }
}

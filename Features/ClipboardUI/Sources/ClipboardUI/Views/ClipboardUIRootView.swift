//
//  ClipboardUI.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI
import PasteboardProvider

public struct ClipboardUIRootView: View {
    
    @StateObject private var store: ClipboardUIStore
    
    public init(
        pasteboardProvider: PasteboardProviding
    ) {
        let initialState = ClipboardUIState(pasteboard: NSPasteboard.general)
        let environment = ClipboardUIEnvironment(
            pasteboardProvider: pasteboardProvider
        )
        let store = ClipboardUIStore(
            initial: initialState,
            reducer: clipboardUIReducer,
            middleware: clipboardUIMiddleware,
            environment: environment,
            subscriber: clipboardUISubscriber
        )
        
        _store = StateObject(wrappedValue: store)
    }
    
    public var body: some View {
        ClipboardMenuBarView()
            .environmentObject(store)
    }
    
}

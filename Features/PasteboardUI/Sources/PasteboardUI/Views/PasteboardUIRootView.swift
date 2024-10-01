//
//  PasteboardUIRootView.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI
import PasteboardProvider

public struct PasteboardUIRootView: View {
    
    @StateObject private var store: PasteboardUIStore
    
    public init() {
        let initialState = PasteboardUIState()
        let environment = PasteboardUIEnvironment()
        let store = PasteboardUIStore(
            initial: initialState,
            reducer: pasteboardUIReducer,
            middleware: pasteboardUIMiddleware,
            environment: environment
        )
        
        _store = StateObject(wrappedValue: store)
    }
    
    public var body: some View {
        PasteboardUIView()
            .environmentObject(store)
    }
    
}

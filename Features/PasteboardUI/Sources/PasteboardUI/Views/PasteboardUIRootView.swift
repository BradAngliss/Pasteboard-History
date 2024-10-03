//
//  PasteboardUIRootView.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI
import PasteboardProvider
import PasteboardAppStorage
import Combine

public struct PasteboardUIRootView: View {
    
    @StateObject private var store: PasteboardUIStore
    
    public init(
        appStorage: PasteboardAppStorageProtocol
    ) {
        let environment = PasteboardUIEnvironment(
            appStorage: appStorage
        )

        let pasteboardHistory = appStorage.getInt(forKey: .historyLimit)
        let initialState = PasteboardUIState(
            isMenuBarActive: appStorage.getBool(forKey: .isMenuBarEnabled),
            pasteboardHistory: pasteboardHistory
        )

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

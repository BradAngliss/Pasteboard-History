//
//  MenuBarRootView.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI
import PasteboardProvider
import PasteboardAppStorage

public struct MenuBarRootView: View {
    
    @StateObject private var store: MenuBarStore
    
    public init(
        appStorage: PasteboardAppStorageProtocol,
        pasteboardProvider: PasteboardProviding
    ) {
        let pasteboardLimit = appStorage.getInt(forKey: .historyLimit)
        let initialState = MenuBarState(
            pasteboard: NSPasteboard.general,
            pasteboardLimit: pasteboardLimit
        )
        let environment = MenuBarEnvironment(
            pasteboardProvider: pasteboardProvider,
            appStorage: appStorage
        )
        let store = MenuBarStore(
            initial: initialState,
            reducer: menuBarReducer,
            middleware: menuBarMiddleware,
            environment: environment,
            subscriber: menuBarSubscriber
        )
        
        _store = StateObject(wrappedValue: store)
    }
    
    public var body: some View {
        MenuBarView()
            .environmentObject(store)
    }
    
}

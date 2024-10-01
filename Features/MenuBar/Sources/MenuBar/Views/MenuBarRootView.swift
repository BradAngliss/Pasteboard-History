//
//  MenuBarRootView.swift
//  MenuBar
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI
import PasteboardProvider

public struct MenuBarRootView: View {
    
    @StateObject private var store: MenuBarStore
    
    public init(
        pasteboardProvider: PasteboardProviding
    ) {
        let initialState = MenuBarState(pasteboard: NSPasteboard.general)
        let environment = MenuBarEnvironment(
            pasteboardProvider: pasteboardProvider
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

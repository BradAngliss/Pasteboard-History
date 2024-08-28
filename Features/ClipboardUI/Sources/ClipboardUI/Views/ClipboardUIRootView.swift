//
//  ClipboardUI.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import SwiftUI

public struct ClipboardUIRootView: View {
    
    @StateObject private var store: ClipboardUIStore
    
    public init() {
        
        let initialState = ClipboardUIState()
        
        let store = ClipboardUIStore(initial: initialState,
                              reducer: clipboardUIReducer,
                              middleware: clipboardUIMiddleware)
        
        _store = StateObject(wrappedValue: store)
    }
    
    public var body: some View {
        ClipboardMenuBarView()
            .environmentObject(store)
    }
    
}

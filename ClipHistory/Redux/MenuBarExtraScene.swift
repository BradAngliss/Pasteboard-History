//
//  MenuBarExtraScene.swift
//  ClipHistory
//
//  Created by Brad Angliss on 03/10/2024.
//

import Foundation
import SwiftUI
import Localizable
import MenuBar
struct MenuBarExtraScene: Scene {
    @StateObject private var store: AppStore

    init(store: AppStore) {
        _store = StateObject(wrappedValue: store)
    }

    var body: some Scene {
        let isShowingMenuBar: Binding<Bool> = .init(
            get: { store.state.isShowingMenuBar },
            set: { _ in /* not required */ }
        )

        MenuBarExtra(
            Localizable.stringFor(key: "MenuBarExtra_Title"),
            systemImage: "clipboard",
            isInserted: isShowingMenuBar
        ) {
            MenuBarRootView(
                appStorage: store.environment.appStorage,
                pasteboardProvider: store.environment.pasteboardProvider
            )
            .frame(width: 300, height: 250)
        }
        .menuBarExtraStyle(.window)
        .environmentObject(store)

    }
}

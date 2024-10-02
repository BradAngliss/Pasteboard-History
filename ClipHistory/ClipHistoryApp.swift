//
//  ClipHistoryApp.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import SwiftUI
import MenuBar
import PasteboardUI
import Localizable

struct ClipHistoryApp: App {
    @StateObject private var store: AppStore

    var appEnvironment: AppEnvironmentProtocol

    init() {
        appEnvironment = AppEnvironment()
        let store = AppStore(
            initial: .init(),
            reducer: appReducer,
            middleware: appMiddleware,
            environment: appEnvironment
        )
        _store = StateObject(wrappedValue: store)
    }

    var body: some Scene {
        WindowGroup {
            Text("Test window group")
                .navigationTitle(Localizable.stringFor(key: "MenuBarExtra_Title"))
        }
        .commands {
            ClipHistoryCommands()
        }

        Settings {
            PasteboardUIRootView(
                appStorage: appEnvironment.appStorage
            )
            .environmentObject(store)
        }

        MenuBarExtra(Localizable.stringFor(key: "MenuBarExtra_Title"), systemImage: "clipboard") {
            MenuBarRootView(
                pasteboardProvider: store.environment.pasteboardProvider
            )
            .frame(width: 300, height: 250)
        }
        .menuBarExtraStyle(.window)
        .environmentObject(store)
    }
}

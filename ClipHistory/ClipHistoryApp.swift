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
        let isShowingMenuBar = appEnvironment.appStorage.getBool(forKey: .isMenuBarEnabled)

        let initialState = AppState(isShowingMenuBar: isShowingMenuBar)
        let store = AppStore(
            initial: initialState,
            reducer: appReducer,
            middleware: appMiddleware,
            environment: appEnvironment,
            subscriber: appSubscriber
        )
        _store = StateObject(wrappedValue: store)
    }

    var body: some Scene {

        // MARK: Main Window
        WindowGroup {
            Text("Test window group")
                .navigationTitle(Localizable.stringFor(key: "MenuBarExtra_Title"))
        }
        .commands {
            ClipHistoryCommands()
        }

        // MARK: Settings
        Settings {
            PasteboardUIRootView(
                appStorage: appEnvironment.appStorage
            )
            .environmentObject(store)
        }

        MenuBarExtraScene(store: store)
    }
}

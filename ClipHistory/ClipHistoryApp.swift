//
//  ClipHistoryApp.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import SwiftUI
import ClipboardUI
import Localizable

@main
struct ClipHistoryApp: App {
    var body: some Scene {
        MenuBarExtra(Localizable.stringFor(key: "MenuBarExtra_Title"), systemImage: "clipboard") {
            ClipboardUIRootView()
                .frame(width: 300, height: 250)
        }
        .menuBarExtraStyle(.window)
    }
}

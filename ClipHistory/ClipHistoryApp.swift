//
//  ClipHistoryApp.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import SwiftUI

@main
struct ClipHistoryApp: App {
    
    var timer: Timer!
    let pasteboard: NSPasteboard = .general
    var lastChangeCount: Int = 0
    
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        MenuBarExtra(currentNumber, systemImage: "clipboard") {
            ClipboardView()
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)

            }
            .keyboardShortcut("q")
        }.menuBarExtraStyle(.window)
    }
}

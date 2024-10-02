//
//  AppEnvironment.swift
//  ClipHistory
//
//  Created by Brad Angliss on 22/09/2024.
//

import Foundation
import PasteboardProvider
import SwiftUI
import PasteboardAppStorage

protocol AppEnvironmentProtocol {
    var pasteboardProvider: PasteboardProviding { get }
    var appStorage: PasteboardAppStorageProtocol { get }
}

class AppEnvironment: AppEnvironmentProtocol {
    let pasteboardProvider: PasteboardProviding
    let appStorage: PasteboardAppStorageProtocol

    init() {
        pasteboardProvider = PasteboardProvider(pasteboard: NSPasteboard.general)
        appStorage = PasteboardAppStorageGroup()
    }
}

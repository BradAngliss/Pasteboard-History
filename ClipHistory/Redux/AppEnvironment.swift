//
//  AppEnvironment.swift
//  ClipHistory
//
//  Created by Brad Angliss on 22/09/2024.
//

import Foundation
import PasteboardProvider
import SwiftUI

protocol AppEnvironmentProtocol {
    var pasteboardProvider: PasteboardProviding { get }
}

class AppEnvironment: AppEnvironmentProtocol {
    let pasteboardProvider: PasteboardProviding

    init() {
        pasteboardProvider = PasteboardProvider(pasteboard: NSPasteboard.general)
    }
}

//
//  MenuBarEnvironment.swift
//  MenuBar
//
//  Created by Brad Angliss on 23/09/2024.
//

import Foundation
import PasteboardProvider

protocol MenuBarEnvironmentProtocol {
    var pasteboardProvider: PasteboardProviding { get }
}

class MenuBarEnvironment: MenuBarEnvironmentProtocol {
    let pasteboardProvider: PasteboardProviding

    init(
        pasteboardProvider: PasteboardProviding
    ) {
        self.pasteboardProvider = pasteboardProvider
    }
}

//
//  MenuBarEnvironment.swift
//  MenuBar
//
//  Created by Brad Angliss on 23/09/2024.
//

import Foundation
import PasteboardProvider
import PasteboardAppStorage

protocol MenuBarEnvironmentProtocol {
    var pasteboardProvider: PasteboardProviding { get }
    var appStorage: PasteboardAppStorageProtocol { get }
}

class MenuBarEnvironment: MenuBarEnvironmentProtocol {
    let pasteboardProvider: PasteboardProviding
    let appStorage: PasteboardAppStorageProtocol

    init(
        pasteboardProvider: PasteboardProviding,
        appStorage: PasteboardAppStorageProtocol
    ) {
        self.pasteboardProvider = pasteboardProvider
        self.appStorage = appStorage
    }
}

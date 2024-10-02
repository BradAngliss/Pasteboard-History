//
//  MenuBarEnvironment.swift
//  MenuBar
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import PasteboardAppStorage

protocol PasteboardUIEnvironmentProtocol {
    var appStorage: PasteboardAppStorageProtocol { get }
}

class PasteboardUIEnvironment: PasteboardUIEnvironmentProtocol {
    let appStorage: PasteboardAppStorageProtocol

    init(appStorage: PasteboardAppStorageProtocol) {
        self.appStorage = appStorage
    }
}

//
//  ClipboardUIEnvironment.swift
//  
//
//  Created by Brad Angliss on 23/09/2024.
//

import Foundation
import PasteboardProvider

protocol ClipboardUIEnvironmentProtocol {
    var pasteboardProvider: PasteboardProviding { get }
}

class ClipboardUIEnvironment: ClipboardUIEnvironmentProtocol {
    let pasteboardProvider: PasteboardProviding

    init(
        pasteboardProvider: PasteboardProviding
    ) {
        self.pasteboardProvider = pasteboardProvider
    }
}

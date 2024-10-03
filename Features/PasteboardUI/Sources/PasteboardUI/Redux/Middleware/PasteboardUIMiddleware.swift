//
//  PasteboardUIMiddleware.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import Swiftux

let pasteboardUIMiddleware: Middleware<PasteboardUIState, PasteboardUIAction, PasteboardUIEnvironmentProtocol> = { state, action, environment in
    switch action {
    case let .setIsMenuBarActive(isActive):
        environment.appStorage.isMenuBarActive.send(isActive)
        environment.appStorage.setValue(forKey: .isMenuBarEnabled, value: isActive)
    case let .setPasteboardHistory(historyLimit):
        environment.appStorage.pasteboardHistoryLimit.send(historyLimit)
        environment.appStorage.setValue(forKey: .historyLimit, value: historyLimit)
    }
    return nil
}

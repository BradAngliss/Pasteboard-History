//
//  MenuBarSubscriber.swift
//  MenuBar
//
//  Created by Brad Angliss on 23/09/2024.
//

import Foundation
import Swiftux

let menuBarSubscriber: Subscribe<MenuBarStore, MenuBarEnvironment> = { store, environment in
    environment.pasteboardProvider.lastChangeCount
        .receive(on: DispatchQueue.main)
        .sink { newChangeCount in
            store.dispatch(.refreshPasteboardItems)
        }
        .store(in: &store.cancellables)
}

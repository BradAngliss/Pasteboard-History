//
//  AppSubscriber.swift
//  ClipHistory
//
//  Created by Brad Angliss on 03/10/2024.
//

import Foundation
import Swiftux

let appSubscriber: Subscribe<AppStore, AppEnvironmentProtocol> = { store, environment in
    environment.appStorage.isMenuBarActive
        .receive(on: DispatchQueue.main)
        .sink { isShowingMenuBar in
            guard let isShowing = isShowingMenuBar else {
                return
            }
            store.dispatch(.setIsShowingMenuBar(isShowing))
        }
        .store(in: &store.cancellables)
}

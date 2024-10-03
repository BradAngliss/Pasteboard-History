//
//  AppMiddleware.swift
//  ClipHistory
//
//  Created by Brad Angliss on 28/09/2024.
//

import Foundation
import Swiftux

let appMiddleware: Middleware<AppState, AppAction, AppEnvironmentProtocol> = { state, action, environment in
    switch action {
        
    case .setIsShowingMenuBar:
        break
    }

    return nil
}

//
//  AppReducer.swift
//  ClipHistory
//
//  Created by Brad Angliss on 28/09/2024.
//

import Foundation
import Swiftux

let appReducer: Reducer<AppState, AppAction> = { state, action in
    var newState = state

    switch action {
    case let .setIsShowingMenuBar(isShowing):
        newState.isShowingMenuBar = isShowing
    }

    return newState
}

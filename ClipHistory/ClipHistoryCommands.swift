//
//  ClipHistoryCommands.swift
//  ClipHistory
//
//  Created by Brad Angliss on 01/10/2024.
//

import SwiftUI
import Localizable

struct ClipHistoryCommands: Commands {
    var body: some Commands {
        ToolbarCommands()
        SidebarCommands()
    }
}

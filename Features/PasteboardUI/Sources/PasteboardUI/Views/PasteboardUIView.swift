//
//  PasteboardUIView.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI
import Localizable

struct PasteboardUIView: View {
    @EnvironmentObject private var store: PasteboardUIStore

    private var pasteboardUIState: PasteboardUIState {
        store.state
    }

    var body: some View {
        TabView {
            PasteboardUIGeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
        }
        .scenePadding()
        .frame(width: 450, height: 450)
    }
}

#Preview {
    PasteboardUIView()
}

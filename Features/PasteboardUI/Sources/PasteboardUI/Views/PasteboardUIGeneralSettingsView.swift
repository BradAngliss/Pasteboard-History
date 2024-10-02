//
//  PasteboardUIGeneralSettingsView.swift
//  PasteboardUI
//
//  Created by Brad Angliss on 01/10/2024.
//

import Foundation
import SwiftUI
import Localizable

struct PasteboardUIGeneralSettingsView: View {
    @EnvironmentObject private var store: PasteboardUIStore

    private var pasteboardUISettingsState: PasteboardUIState {
        store.state
    }

    @State private var stepperValue: Int = 5
    @State private var isToggleOn: Bool = false

    var body: some View {
        let isMenuBarActive: Binding<Bool> = .init(
            get: { pasteboardUISettingsState.isMenuBarActive },
            set: { store.dispatch(.setIsMenuBarActive($0)) }
        )

        VStack {
            Form {
                Toggle(isOn: isMenuBarActive) {
                    Text("Show Menu Bar")
                        .bold()
                }
                .toggleStyle(.switch)
                
                LabeledContent {
                    Stepper(value: $stepperValue, in: 1...10) {
                        Text("\(stepperValue)")
                    }
                } label: {
                    Text("History Limit:")
                        .bold()
                }
            }
            
            Divider()
        }
        .onAppear {
            
        }
    }
}

#Preview {
    PasteboardUIView()
}

//
//  ClipboardMenuBarView.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import Foundation
import SwiftUI
import Localizable

struct ClipboardMenuBarView: View {
    @EnvironmentObject private var store: ClipboardUIStore

    private var clipboardUIState: ClipboardUIState {
        store.state
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Localizable.stringFor(key: "MenuBarExtra_Title"))
                .padding(8)
                .font(.headline)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(clipboardUIState.pasteboardItems.reversed(), id: \.id) { item in
                        ClipboardItemRowView(item: item)
                            .onTapGesture {
                                print("Tapped")
                                store.dispatch(.copyToPasteboard(item))
                            }
                    }
                }
                .padding(.horizontal, 8)
            }
            Spacer()
            Divider()
            footer()
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 8)
        .onAppear {
            store.dispatch(.updateChangeCount(changeCount: NSPasteboard.general.changeCount))
        }
    }

    private func footer() -> some View {
        HStack(spacing: 0) {
            Button {
                store.dispatch(.refreshPasteboardItems)
            } label: {
                Text(Localizable.stringFor(key: "MenuBarExtra_Refresh_Title"))
            }
            .padding(8)
            .frame(maxWidth: .infinity)

            Button {
                NSApplication.shared.terminate(nil)
            } label: {
                Text(Localizable.stringFor(key: "MenuBarExtra_Quit_Title"))
            }
            .keyboardShortcut("q")
            .padding(8)
            .frame(maxWidth: .infinity)

        }
    }
}

#Preview {
    ClipboardMenuBarView()
}

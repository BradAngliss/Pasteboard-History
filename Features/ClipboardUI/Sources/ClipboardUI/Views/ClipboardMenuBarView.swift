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
                                print(item.pasteboardTypes)
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
        VStack(alignment: .leading, spacing: 4) {
            Text(Localizable.stringFor(key: "MenuBarExtra_Refresh_Title"))
                .onTapGesture {
                    store.dispatch(.refreshPasteboardItems)
                }
            
            Text(Localizable.stringFor(key: "MenuBarExtra_Quit_Title"))
                .onTapGesture {
                    NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    ClipboardMenuBarView()
}

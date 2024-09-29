//
//  ClipboardMenuBarView.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import Foundation
import SwiftUI
import Localizable
import Common

struct ClipboardMenuBarView: View {
    @EnvironmentObject private var store: ClipboardUIStore

    private var clipboardUIState: ClipboardUIState {
        store.state
    }

    var body: some View {
        let pasteboardItems: Binding<[PasteboardItem]> = .init(
            get: { clipboardUIState.items.reversed() },
            set: { _ in /* not required*/ }
        )

        VStack(alignment: .leading) {
            Text(Localizable.stringFor(key: "MenuBarExtra_Title"))
                .padding(8)
                .font(.headline)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(pasteboardItems, id: \.self) { item in
                        ClipboardItemRowView(item: item.wrappedValue)
                            .onTapGesture {
                                store.dispatch(.copyToPasteboard(item.wrappedValue))
                            }
                    }
                }
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
        VStack(spacing: 4) {
            HStack {
                Text(Localizable.stringFor(key: "MenuBarExtra_Refresh_Title"))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .hoverBackground()
            .onTapGesture {
                store.dispatch(.refreshPasteboardItems)
            }
            
            HStack {
                Text(Localizable.stringFor(key: "MenuBarExtra_Quit_Title"))
                .keyboardShortcut("q")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .hoverBackground()
            .padding(.bottom, 8)
            .onTapGesture {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}

#Preview {
    ClipboardMenuBarView()
}

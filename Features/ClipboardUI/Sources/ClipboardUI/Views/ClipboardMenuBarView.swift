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
            Text(Localizable.stringFor(key: "MenuBarExtra_Heading"))
            
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(clipboardUIState.pasteboardItems.reversed(), id: \.id) { item in
                        if let image = item.image {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else if let text = item.text {
                            Text(text)
                        }
                    }
                }
            }

            Divider()
            HStack {
                Button {
                    store.dispatch(.refreshPasteboardItems)
                } label: {
                    Text(Localizable.stringFor(key: "MenuBarExtra_Refresh_Title"))
                }
                Divider()
                Button {
                    NSApplication.shared.terminate(nil)
                } label: {
                    Text(Localizable.stringFor(key: "MenuBarExtra_Quit_Title"))
                }
                .keyboardShortcut("q")

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            store.dispatch(.updateChangeCount(changeCount: NSPasteboard.general.changeCount))
        }
    }
}

#Preview {
    ClipboardMenuBarView()
}

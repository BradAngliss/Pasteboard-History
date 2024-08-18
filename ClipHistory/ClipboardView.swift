//
//  ClipboardView.swift
//  ClipHistory
//
//  Created by Brad Angliss on 17/06/2024.
//

import Foundation
import SwiftUI

struct ClipboardView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.pasteboardItems.reversed(), id: \.id) { item in
                    if let image = item.image {
                        Image(nsImage: image)
                            .resizable()
                            .frame(width: 100, height: 100)
                    } else if let text = item.text {
                        Text(text)
                    }
                }
            }
            
            Button {
                viewModel.refreshPasteboardItems()
            } label: {
                Text("Refresh")
            }
        }
        
        .onAppear {
            viewModel.updateChangeCount(changeCount: NSPasteboard.general.changeCount)
        }
    }
}

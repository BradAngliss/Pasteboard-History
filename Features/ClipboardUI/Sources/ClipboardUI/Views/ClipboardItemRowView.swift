//
//  ClipboardItemRowView.swift
//  ClipboardUI
//
//  Created by Brad Angliss on 21/06/2024.
//

import Foundation
import SwiftUI
import Localizable

struct ClipboardItemRowView: View {
    let item: MenuBarRow

    var body: some View {
        VStack {
            if let image = item.image {
                Image(nsImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
            } else if let text = item.text {
                HStack {
                    Text(text)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            Divider()
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    ClipboardItemRowView(item: .arrange)
}

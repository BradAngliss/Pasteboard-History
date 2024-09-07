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
    let item: PasteboardItem

    var body: some View {
        VStack {
            itemRow(
                item: item
            )
            Divider()
        }
        .padding(.vertical, 2)
    }

    @ViewBuilder
    func itemRow(item: PasteboardItem) -> some View {
        switch item.availableType {
        case .string, .URL:
            HStack {
                Text(String(decoding: item.displayData, as: UTF8.self))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .lineLimit(1)
        case .tiff, .png:
            HStack {
                Image(nsImage: NSImage(data: item.displayData)!)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                Text(item.availableType.rawValue)
            }
        case .fileURL:
            HStack {
                Image(nsImage: NSImage(data: item.displayData)!)
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                Text(item.availableType.rawValue)
            }
        default:
            EmptyView()
        }
    }
}

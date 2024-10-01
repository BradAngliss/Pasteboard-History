//
//  PasteboardItem+Arrange.swift
//  
//
//  Created by Brad Angliss on 06/09/2024.
//

import Foundation
@testable import ClipboardUI

extension PasteboardItem {
    static var arrange: PasteboardItem {
        .init(
            availableType: .string, pasteboardDataTypes: [.string: "test string".data(using: .utf8)!]
        )
    }
}

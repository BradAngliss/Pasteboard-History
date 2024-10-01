//
//  ClipboardUIStateTests.swift
//
//
//  Created by Brad Angliss on 07/09/2024.
//

import Foundation
import XCTest
@testable import ClipboardUI

final class ClipboardUIStateTests: XCTestCase {

    func test_pasteboardItemExists_true() {
        let pasteboardItem: PasteboardItem = .arrange
        var state = ClipboardUIState(pasteboard: MockNSPasteboard())
        state.items.append(pasteboardItem)

        XCTAssertTrue(state.pasteboardItemExists(for: pasteboardItem))
    }

    func test_pasteboardItemExists_false() {
        let pasteboardItem: PasteboardItem = .arrange
        let state = ClipboardUIState(pasteboard: MockNSPasteboard())

        XCTAssertTrue(state.pasteboardItemExists(for: pasteboardItem))
    }
}

//
//  ClipboardUIMiddlewareTests.swift
//  
//
//  Created by Brad Angliss on 06/09/2024.
//

import Foundation
import XCTest
@testable import ClipboardUI

final class ClipboardUIMiddlewareTests: XCTestCase {
    func test_updateChangeCount() async {
        let initialState = ClipboardUIState()

        let resultAction = await clipboardUIMiddleware(
                initialState,
                .updateChangeCount(changeCount: 1)
        )

        XCTAssertNil(resultAction)
    }
    
    func test_addPasteboardItems() async {
        let initialState = ClipboardUIState()

        let resultAction = await clipboardUIMiddleware(
                initialState,
                .addPasteboardItems(.arrange)
        )

        XCTAssertNil(resultAction)
    }

    // TODO: Mock NSPasteboard for testing
}

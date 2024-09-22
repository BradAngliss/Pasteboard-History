//
//  ClipboardUIReducerTests.swift
//  
//
//  Created by Brad Angliss on 06/09/2024.
//

import Foundation
import XCTest
@testable import ClipboardUI

final class ClipboardUIReducerTests: XCTestCase {
    var mockNSPasteboard: MockNSPasteboard!

    override func setUp() {
        super.setUp()

        mockNSPasteboard = MockNSPasteboard()
    }

    func test_refreshPasteboardItems() {
        let initialState = ClipboardUIState(pasteboard: mockNSPasteboard)
        let expectedState = initialState
        
        let resultState = clipboardUIReducer(initialState, .refreshPasteboardItems)
        
        XCTAssertEqual(expectedState, resultState)
    }
    
    
    func test_copyToPasteboard() {
        let initialState = ClipboardUIState(pasteboard: mockNSPasteboard)
        let expectedState = initialState
        
        let resultState = clipboardUIReducer(initialState, .copyToPasteboard(.arrange))
        
        XCTAssertEqual(expectedState, resultState)
    }
    
    func test_updateChangeCount_noChange() {
        var initialState = ClipboardUIState(pasteboard: mockNSPasteboard)
        initialState.lastChangeCount = 2
        
        let expectedState = initialState
        
        let resultState = clipboardUIReducer(initialState, .updateChangeCount(changeCount: 2))
        
        XCTAssertEqual(expectedState, resultState)
    }
    
    func test_updateChangeCount_setChange() {
        var initialState = ClipboardUIState(pasteboard: mockNSPasteboard)
        initialState.lastChangeCount = 1
        
        var expectedState = initialState
        expectedState.lastChangeCount = 2
        
        let resultState = clipboardUIReducer(initialState, .updateChangeCount(changeCount: 2))
        
        XCTAssertEqual(expectedState, resultState)
    }
    
    func test_addPasteboardItems() {
        let initialState = ClipboardUIState(pasteboard: mockNSPasteboard)

        var expectedState = initialState
        expectedState.items.append(.arrange)

        let resultState = clipboardUIReducer(initialState, .addPasteboardItems(.arrange))

        XCTAssertEqual(expectedState, resultState)
    }

    func test_movePasteboardItemToTop() {
        var initialState = ClipboardUIState(pasteboard: mockNSPasteboard)
        initialState.items.append(
            .init(availableType: .string, pasteboardDataTypes: [.string: "other test string".data(using: .utf8)!])
         )
        initialState.items.append(.arrange)

        var expectedState = initialState
        expectedState.items.append(.arrange)
        expectedState.items.append(
            .init(availableType: .string, pasteboardDataTypes: [.string: "other test string".data(using: .utf8)!])
         )

        let resultState = clipboardUIReducer(initialState, .movePasteboardItemToTop(.arrange))

        XCTAssertEqual(expectedState, resultState)
    }
}

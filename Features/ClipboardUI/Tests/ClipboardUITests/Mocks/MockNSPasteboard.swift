//
//  MockNSPasteboard.swift
//
//
//  Created by Brad Angliss on 06/09/2024.
//

import Foundation
import SwiftUI

public class MockNSPasteboard: NSPasteboard {

    override public var types: [NSPasteboard.PasteboardType] {
        [.string, .fileURL, .rtf, .rtfd]
    }

    override public func availableType(from types: [NSPasteboard.PasteboardType]) -> NSPasteboard.PasteboardType? {
        return types.contains(.string) ? .string : nil
    }
}

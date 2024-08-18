//
//  RowDataModel.swift
//  ClipHistory
//
//  Created by Brad Angliss on 18/06/2024.
//

import Foundation
import AppKit

struct RowDataModel {
    let id = UUID()
    let text: String?
    let image: NSImage?
    
    init(text: String? = nil,
         image: NSImage? = nil) {
        self.text = text
        self.image = image
    }
    
}

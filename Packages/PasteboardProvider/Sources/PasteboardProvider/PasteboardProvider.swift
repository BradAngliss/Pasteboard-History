//
//  PasteboardProvider.swift
//  PasteboardProvider
//
//  Created by Brad Angliss on 22/09/2024.
//

import SwiftUI
import Combine

#if os(macOS)

public protocol PasteboardProviding {
    var lastChangeCount: CurrentValueSubject<Int, Never> { get set }

    var pasteboard: NSPasteboard { get }

    var timer: Timer? { get }

    func closeTimer() -> Void
}

public final class PasteboardProvider: PasteboardProviding {

    public var lastChangeCount: CurrentValueSubject<Int, Never> = .init(0)

    public var pasteboard: NSPasteboard

    public weak var timer: Timer?
    
    public init(pasteboard: NSPasteboard) {
        self.pasteboard = pasteboard
        self.startTimer()
    }

    deinit {
        self.closeTimer()
    }

    public func startTimer() {
        self.closeTimer()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.checkChangeCount()
        }
    }
    
    public func checkChangeCount() {
        if self.pasteboard.changeCount != lastChangeCount.value {
            lastChangeCount.send(self.pasteboard.changeCount)
        }
    }

    public func closeTimer() {
        timer?.invalidate()
    }
}

#endif

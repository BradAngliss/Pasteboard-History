//
//  ClipHistoryApp.swift
//  Common
//
//  Created by Brad Angliss on 29/09/2024.
//

import SwiftUI

public extension View {
    func hoverBackground(
        isHovering: Binding<Bool> = .constant(false)
    ) -> some View {
        self.modifier(HoverBackgroundViewModifier(isHovering: isHovering.wrappedValue))
    }
}

private struct HoverBackgroundViewModifier: ViewModifier {
    @State public var isHovering: Bool
    
    func body(content: Content) -> some View {
        content
            .background(isHovering ? .gray : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .onHover(perform: { hovering in
                isHovering = hovering
            })
    }
}

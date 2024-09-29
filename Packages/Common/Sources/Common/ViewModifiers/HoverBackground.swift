//
//  ClipHistoryApp.swift
//  Common
//
//  Created by Brad Angliss on 29/09/2024.
//

import SwiftUI

public extension View {
    func hoverBackground(
        hoverColor: Color = .gray,
        isHovering: Binding<Bool> = .constant(false)
    ) -> some View {
        self.modifier(HoverBackgroundViewModifier(
            hoverColor: hoverColor,
            isHovering: isHovering.wrappedValue
        ))
    }
}

private struct HoverBackgroundViewModifier: ViewModifier {
    let hoverColor: Color
    @State public var isHovering: Bool
    
    func body(content: Content) -> some View {
        content
            .background(isHovering ? hoverColor : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .onHover(perform: { hovering in
                isHovering = hovering
            })
    }
}

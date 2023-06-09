//
//  GlassView.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct GlassView : ViewModifier {

    let style: Material
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding()
            .background(style)
            .cornerRadius(cornerRadius)
            .shadow(color: .white.opacity(0.2), radius: 1, x: -1, y: -2)
            .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

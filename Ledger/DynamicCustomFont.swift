//
//  DynamicCustomFont.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct DynamicCustomFont: ViewModifier {
    var name: String
    var style: UIFont.TextStyle

    @Environment(\.sizeCategory) var sizeCategory

    func body(content: Content) -> some View {
        let defaultFont = UIFont.preferredFont(forTextStyle: style)
        let customFont = UIFont(name: name, size: defaultFont.pointSize) ?? defaultFont
        let font = UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)

        return content.font(Font.custom(font.fontName, size: font.pointSize))
    }
}


extension View {
    func dynamicCustomFont(name: String, style: UIFont.TextStyle) -> some View {
        self.modifier(DynamicCustomFont(name: name, style: style))
    }
}

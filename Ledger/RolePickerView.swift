//
//  RolePickerView.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct RolePickerView: View {

    let style: Material

    let height: CGFloat

    init(style: Material, height: CGFloat = 125.0) {
        self.style = style
        self.height = height
    }

    var body: some View {
        HStack(spacing: 0.0) {
            Button(action: becomeUser, label: {
                ButtonWithIcon(iconName: "person.3.fill",
                               text: "I'm a user").frame(maxWidth: .infinity, minHeight: height)
            })
            Divider()
            Button(action: becomeUser, label: {
                    ButtonWithIcon(iconName: "person.badge.shield.checkmark.fill",
                                   text: "I'm a creator")
                    .frame(maxWidth: .infinity, minHeight: height)
            })
        }
        .frame(height: height)
        .modifier(GlassView(style: style, cornerRadius: 35))
        .padding()
    }

}

func becomeUser() {

}

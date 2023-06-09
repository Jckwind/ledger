//
//  ButtonWithIcon.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct ButtonWithIcon: View {

    let iconName: String
    let text: String

    var body: some View {
        VStack {
            Image(systemName: iconName)
                .font(.system(size: 35).bold())
                .foregroundStyle(
                    Color.black.opacity(0.2).shadow(.inner(color: .black, radius: 2))
                )
            Text(text)
                .bold()
                .foregroundStyle(
                    Color.black.opacity(0.2).shadow(.inner(color: .black, radius: 1))
                )
        }.padding()
    }

}

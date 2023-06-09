//
//  ContentView.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct ContentView: View {

    @State private var showWelcomeText: Bool = false
    @State private var showLedgerText: Bool = false
    @State private var showMostPeopleText: Bool = false

    var body: some View {
        VStack {
            Spacer()
            TypeWriterView(start: $showWelcomeText,
                           text: "Welcome. This is",
                           font: "EBGaramondRoman-Medium",
                           style: .title3,
                           completion: {
                self.showLedgerText = true
            })
            TypeWriterView(start: $showLedgerText,
                           text: "Ledger",
                           font: "EBGaramondRoman-ExtraBold",
                           style: .title1,
                           completion: {
                self.showMostPeopleText = true
            })
            Spacer()
            TypeWriterView(start: $showMostPeopleText,
                           text: "News for most people",
                           delay: 0.05,
                           font: "EBGaramondRoman-Medium",
                           style: .title3)
            Spacer()
            RolePickerView(style: .ultraThinMaterial)
            Spacer()
        }
        .background(Image("paper"))
        .onAppear {
            showWelcomeText = true
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

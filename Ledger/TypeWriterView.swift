//
//  TypeWriterView.swift
//  Ledger
//
//  Created by Jack Windham on 6/8/23.
//

import SwiftUI

struct TypeWriterView: View {
    @Binding var start: Bool
    @State private var text: String = ""

    let finalText: String
    let delay: Double
    let fontName: String
    let style: UIFont.TextStyle
    let completion: (() -> Void)?

    init(start: Binding<Bool> = .constant(false),
         text finalText: String,
         delay: Double = 0.1,
         font: String = "EBGaramond-Regular",
         style: UIFont.TextStyle = .body,
         completion: (() -> Void)? = nil) {
        self._start = start
        self.finalText = finalText
        self.delay = delay
        self.fontName = font
        self.style = style
        self.completion = completion
    }

    var body: some View {
            ZStack {
                Text(finalText)
                    .dynamicCustomFont(name: fontName, style: style)
                    .hidden()

                Text(text)
                    .dynamicCustomFont(name: fontName, style: style)
                    .onChange(of: start) { newValue in
                        if newValue {
                            typeWriter()
                        }
                    }
            }
        }

    func typeWriter(at position: Int = 0) {
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        } else {
            completion?()
        }
    }
}

struct TypeWriterView_Previews: PreviewProvider {
    static var previews: some View {
        TypeWriterView(text: "Ledger")
    }
}

extension String {
    subscript(offset: Int) -> Character {
        guard offset >= 0 && offset < count else {
            return Character("") // Return empty character for out-of-bounds index
        }
        return self[index(startIndex, offsetBy: offset)]
    }
}

//
//  TextArea.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/8.
//

import Foundation
import SwiftUI

struct TextArea: View {
    private let placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty || text.isBlank {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(5)
            }
            TextEditor(text: $text)
        }
    }
}

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}

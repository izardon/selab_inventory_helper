//
//  ButtonWithImage.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct ButtonWithImage: View {
    var width: CGFloat
    var height: CGFloat
    var text: String
    var textSize: CGFloat
    var image: String
    var action: (() -> Void)
    
    var body: some View {
        VStack{
            ZStack {
                ZStack{
                    Image(self.image)
                        .resizable()
                        .scaledToFill()
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.7)
                }
                .frame(width: self.width, height: self.height, alignment: .center)
                
                Button(action: self.action, label: {
                    Text(self.text)
                        .font(.system(size: self.textSize))
                        .bold()
                })
            }
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 3))
        }
        
    }
}

struct ButtonWithImage_Previews: PreviewProvider {
    static var previews: some View {
        ButtonWithImage(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8, text: "立即盤點", textSize: 26, image: "inventory", action: {})
    }
}

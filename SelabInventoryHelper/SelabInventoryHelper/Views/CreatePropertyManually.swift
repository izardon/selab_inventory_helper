//
//  CreatePropertyManually.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct CreatePropertyManually: View {
    @State private var property: Property = Property()
    
    var body: some View {
        VStack {
            Form {
                TextField("財產編號", text: $property.identify)
                    .padding(.vertical, 10)
                TextField("財產名稱", text: $property.name)
                    .padding(.vertical, 10)
                TextField("存放地點", text: $property.location)
                    .padding(.vertical, 10)
                TextField("財產描述", text: $property.description)
                    .padding(.vertical, 10)
                Image("inventory")
                    .resizable()
                    .scaledToFill()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("儲存")
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 50,
                            maxHeight: .infinity,
                            alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                        )
                        .foregroundColor(.white)
                })
                .background(Color(red: 71 / 255, green: 82 / 255, blue: 94 / 255))
                .cornerRadius(20)
            }
        }
    }
}

struct CreatePropertyManually_Previews: PreviewProvider {
    static var previews: some View {
        CreatePropertyManually()
    }
}

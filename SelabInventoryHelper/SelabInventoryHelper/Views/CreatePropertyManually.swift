//
//  CreatePropertyManually.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct CreatePropertyManually: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var property: Property
    @State private var showingSaveAlert: Bool = false
    
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
                Button(action: {
                    viewModel.saveProperty(property: property)
                    showingSaveAlert = true
                }
                , label: {
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
                .alert(isPresented: $showingSaveAlert) {
                    Alert(
                        title: Text(viewModel.title),
                        message: Text(viewModel.message),
                        dismissButton: .default(Text("確定"), action: {
                            if viewModel.operationSuccess {
                                property = Property()
                            }
                        })
                    )
                }
                .background(Color(red: 71 / 255, green: 82 / 255, blue: 94 / 255))
                .cornerRadius(20)
            }
        }
    }
}

struct CreatePropertyManually_Previews: PreviewProvider {
    static var previews: some View {
        CreatePropertyManually(viewModel: CreatePropertyManually.ViewModel(), property: .constant(Property()))
    }
}

//
//  InventoryProperty.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import SwiftUI

struct InventoryProperty: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                List(viewModel.inventoryLog.inventoryItems, id: \.self) { (inventoryItem)  in
                    ScrollView {
                        HStack {
                            Text(inventoryItem.id)
                            Image(systemName: inventoryItem.isChecked ? "checkmark.square" : "square")
                            Spacer()
                        }
                    }
                }
                .onAppear(perform: {
                    self.viewModel.getUnCompleteOrAddNewInventoryLog()
                })
                Spacer()
            }
            .navigationTitle("立即盤點")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


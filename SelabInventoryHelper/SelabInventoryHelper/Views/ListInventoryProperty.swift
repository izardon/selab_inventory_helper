//
//  InventoryProperty.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import SwiftUI

struct ListInventoryProperty: View {
    @ObservedObject var viewModel: InventoryProperty.ViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            List {
                ForEach(viewModel.inventoryLog.inventoryItems, id: \.id) { inventoryItem in
                    ScrollView {
                        HStack {
                            Text(inventoryItem.id)
                            Spacer()
                            Image(systemName: inventoryItem.isChecked ? "checkmark.square" : "square")
                        }
                    }
                }
            }
        }
        .navigationTitle("立即盤點")
        .navigationBarTitleDisplayMode(.inline)
    }
}


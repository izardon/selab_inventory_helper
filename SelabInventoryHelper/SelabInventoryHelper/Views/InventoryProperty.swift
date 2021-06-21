//
//  InventoryProperty.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import SwiftUI

struct InventoryProperty: View {
    @State var selectedTab: Int = 0
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var btnComplete : some View {
        Button(
            "完成盤點",
            action: {
                viewModel.inventoryLog.isComplete = true
                viewModel.updateInventoryLog(inventoryLog: viewModel.inventoryLog)
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("條碼掃描").tag(0)
                Text("盤點情況").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch(selectedTab) {
            case 0:
                InventoryPropertyBarcodeScanner(viewModel: viewModel)
            case 1:
                ListInventoryProperty(viewModel: viewModel)
            default:
                Color.red
                    .ignoresSafeArea()
            }
        }
        .onAppear(perform: {
            self.viewModel.getUnCompleteOrAddNewInventoryLog()
        })
        .navigationTitle("立即盤點")
        .navigationBarItems(trailing: btnComplete)
    }
}

struct InventoryProperty_Previews: PreviewProvider {
    static var previews: some View {
        InventoryProperty(viewModel: InventoryProperty.ViewModel())
    }
}

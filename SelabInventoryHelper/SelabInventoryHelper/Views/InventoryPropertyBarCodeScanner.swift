//
//  InventoryPropertyBarCodeScanner.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation
import SwiftUI
import CarBode
import AVFoundation //import to access barcode types you want to scan

struct InventoryPropertyBarcodeScanner: View {
    @ObservedObject var viewModel: InventoryProperty.ViewModel
    @State private var isFoundBarcode: Bool = false
    @State private var showingAlter: Bool = false
    @State private var foundInventoryItemId = ""
    @State private var foundBarcode = ""
    
    var body: some View {
        VStack {
            CBScanner(
                supportBarcode: .constant([.qr, .ean13, .ean8]), //Set type of barcode you want to scan
                scanInterval: .constant(5.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                if(!isFoundBarcode) {
                    print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                    self.foundBarcode = $0.value
                    self.isFoundBarcode = true
                    self.foundInventoryItemId = ""
                    
                    viewModel.inventoryLog.inventoryItems.forEach({inventoryItem in
                        if(self.foundBarcode == inventoryItem.id) {
                            self.foundInventoryItemId = inventoryItem.id
                            inventoryItem.isChecked = true
                            viewModel.updateInventoryLog(inventoryLog: viewModel.inventoryLog)
                            return
                        }
                    })
                    
                    showingAlter = true
                }
            }
            .alert(isPresented: $showingAlter) {
                if self.foundInventoryItemId.isEmpty {
                    return Alert(
                        title: Text("沒有這筆財產"),
                        message: Text(self.foundBarcode),
                        dismissButton: .default(Text("確定"), action: {
                            self.isFoundBarcode = false
                            self.showingAlter = false
                        })
                    )
                } else {
                    return  Alert(
                        title: Text("盤點成功"),
                        message: Text(self.foundInventoryItemId),
                        dismissButton: .default(Text("確定"), action: {
                            self.isFoundBarcode = false
                            self.showingAlter = false
                        })
                    )
                }
            }
        }
    }
}

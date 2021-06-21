//
//  InventoryHistoryRow.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 21/06/2021.
//

import SwiftUI

struct InventoryHistoryRow: View {
    @ObservedObject var viewModel: InventoryHistory.ViewModel
    @StateObject var log: InventoryLog
    
    var body: some View {
        NavigationLink(destination: InventoryLogDetail(log: log)) {
            VStack (alignment: .leading){
                Text(log.name)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                Text("財產總數：\(log.getPropertiesCount())")
                Text("已清點：\(log.getCheckedItemsCount())")
                Text("未清點：\(log.getUncheckedItemsCount())")
            }
        }
        .contentShape(Rectangle())
        .buttonStyle(PlainButtonStyle())
    }
}

struct InventoryHistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        InventoryHistoryRow(viewModel: InventoryHistory.ViewModel(), log: InventoryLog(documentId: "test", name: "盤點紀錄#2021/06/21 18:35:23", inventoryItems: [InventoryItem(name: "test", id: "12323", isChecked: true)], isComplete: true))
    }
}

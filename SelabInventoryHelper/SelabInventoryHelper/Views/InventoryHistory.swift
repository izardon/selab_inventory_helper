//
//  InventoryHistory.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 18/06/2021.
//

import SwiftUI

struct InventoryHistory: View {
    @State var searchText: String = ""
    @State var logs: [InventoryLog]
    
    var body: some View {
        VStack (alignment: .leading){
            SearchBar(searchText: $searchText)
                .padding(.bottom, 15)
            List(logs, id: \.name) { (log) in
                ScrollView {
                    VStack (alignment: .leading){
                        Text(log.name)
                            .fontWeight(.bold)
                            .padding(.bottom, 2)
                        Text("財產總數：\(log.getPropertiesCount())")
                        Text("已清點：\(log.getCheckedItemsCount())")
                        Text("未清點：\(log.getUncheckedItemsCount())")
                    }
                    .padding(.leading, 10)
                    .padding(.vertical, 10)
                }
            }
            Spacer()
        }
        .navigationTitle("盤點紀錄")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InventoryHistory_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            InventoryHistory(logs: [InventoryLog(documentId: "jdlkasjdlas", name: "盤點紀錄#2021/06/18:18:30:13", inventoryItems: [InventoryItem(name: "電腦一台", id: "3345-4567hfgh-24234", isChecked: true), InventoryItem(name: "網卡一張", id: "3345-4567hfgh-2546234", isChecked: false)], isComplete: false), InventoryLog(documentId: "fkjdsal", name: "盤點紀錄#2021/06/18:30:35:37", inventoryItems: [InventoryItem(name: "電腦一台", id: "3345-4567hfgh-24234", isChecked: true), InventoryItem(name: "網卡一張", id: "3345-4567hfgh-2546234", isChecked: false)], isComplete: false)])
            }
        }
}

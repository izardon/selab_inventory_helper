//
//  InventoryLogDetail.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 21/06/2021.
//

import SwiftUI

struct InventoryLogDetail: View {
    @StateObject var log: InventoryLog
    
    var body: some View {
        VStack (alignment: .leading){
            Text("\(log.name)")
                .font(.title)
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("財產總數：\(log.inventoryItems.count)")
                .font(.title2)
                .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("已清點")
                .font(.title2)
            List(log.inventoryItems.filter({ $0.isChecked }), id: \.id) { log in
                Text("id: \(log.id)")
                Text("name: \(log.name)")
            }
            Text("未清點")
                .font(.title2)
            List(log.inventoryItems.filter({ !$0.isChecked }), id: \.id) { log in
                Text("id: \(log.id)")
                Text("name: \(log.name)")
            }
        }
        .padding()
    }
}

struct InventoryLogDetail_Previews: PreviewProvider {
    static var previews: some View {
        InventoryLogDetail(log: InventoryLog(documentId: "test", name: "盤點紀錄#2021/06/21 18:35:23", inventoryItems: [InventoryItem(name: "test", id: "12323", isChecked: true)], isComplete: true))
    }
}

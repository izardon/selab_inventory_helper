//
//  InventoryTaking.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct InventoryTaking: View {
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                ButtonWithImage(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7, text: "立即盤點", textSize: 26, image: "inventory", action: {})
                NavigationLink(
                    destination: InventoryHistory(searchText: "", logs: self.fetchInventoryLogs()),
                    label: {
                        ButtonWithImage(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7,  text: "盤點紀錄", textSize: 26, image: "book", action: {})
                    })
            }
        }
    }
    
    func fetchInventoryLogs () -> [InventoryLog] {
        return [InventoryLog(name: "盤點紀錄#2021/06/18:18:30:13", inventoryItems: [InventoryItem(name: "電腦一台", id: "3345-4567hfgh-24234", isChecked: true), InventoryItem(name: "網卡一張", id: "3345-4567hfgh-2546234", isChecked: false)]), InventoryLog(name: "盤點紀錄#2021/06/18:30:35:37", inventoryItems: [InventoryItem(name: "電腦一台", id: "3345-4567hfgh-24234", isChecked: true), InventoryItem(name: "網卡一張", id: "3345-4567hfgh-2546234", isChecked: false)])]
    }
}

struct InventoryTaking_Previews: PreviewProvider {
    static var previews: some View {
        InventoryTaking()
    }
}

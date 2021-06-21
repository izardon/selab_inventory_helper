//
//  InventoryLog.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 18/06/2021.
//

import Foundation

class InventoryLog: ObservableObject {
    var documentId: String = ""
    var name: String
    var isComplete: Bool
    var inventoryItems: [InventoryItem]
    
    init(documentId: String, name: String, inventoryItems: [InventoryItem], isComplete: Bool) {
        self.documentId = documentId
        self.name = name
        self.isComplete = isComplete
        self.inventoryItems = inventoryItems
    }
    
    func getPropertiesCount () -> Int {
        return inventoryItems.count
    }
    
    func getCheckedItemsCount() -> Int {
        let checkedItems = inventoryItems.filter({ item in
            return item.isChecked
        })
        
        return checkedItems.count
    }
    
    func getUncheckedItemsCount() -> Int {
        let unCheckedItems = inventoryItems.filter({ item in
            return !item.isChecked
        })
        
        return unCheckedItems.count
    }
}

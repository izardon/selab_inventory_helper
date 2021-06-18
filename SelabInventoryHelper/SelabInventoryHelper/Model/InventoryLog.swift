//
//  InventoryLog.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 18/06/2021.
//

import Foundation

struct InventoryLog {
    let name: String
    let inventoryItems: [InventoryItem]
    
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

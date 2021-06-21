//
//  InventoryItem.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 18/06/2021.
//

import Foundation

class InventoryItem: ObservableObject {
    var name: String = ""
    var id: String = ""
    var isChecked: Bool = false
    
    init(name: String, id: String, isChecked: Bool) {
        self.name = name
        self.id = id
        self.isChecked = isChecked
    }
}

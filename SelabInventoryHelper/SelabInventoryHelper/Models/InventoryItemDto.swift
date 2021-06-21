//
//  InventoryItemDto.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation
import FirebaseFirestoreSwift

class InventoryItemDto: Codable {
    let name: String
    let id: String
    let isChecked: Bool
    
    init(name: String, id: String, isChecked: Bool) {
        self.id = id
        self.name = name
        self.isChecked = isChecked
    }
}

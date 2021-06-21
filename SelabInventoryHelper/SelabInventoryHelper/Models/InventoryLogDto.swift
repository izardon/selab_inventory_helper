//
//  InventoryLogDto.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation
import FirebaseFirestoreSwift

class InventoryLogDto: Codable {
    @DocumentID var id: String?
    var name = ""
    var isComplete: Bool
    var inventoryItems = [InventoryItemDto]()
    
    init(documentId: String, name: String, inventoryItems: [InventoryItemDto], isComplete: Bool) {
        self.id = documentId
        self.name = name
        self.isComplete = isComplete
        self.inventoryItems = inventoryItems
    }
}

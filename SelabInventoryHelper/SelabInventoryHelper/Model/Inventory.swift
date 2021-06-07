//
//  Inventory.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation

class Inventory {
    var identify = ""
    var name: String = ""
    var location: String = ""
    var description: String = ""
    
    init(identify: String, name: String, location: String, description: String) {
        self.identify = identify
        self.name = name
        self.location = location
        self.description = description
    }
}

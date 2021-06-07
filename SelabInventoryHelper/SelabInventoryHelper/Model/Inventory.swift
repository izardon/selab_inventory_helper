//
//  Inventory.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

class Inventory {
    var identify = ""
    var name: String = ""
    var location: String = ""
    var description: String = ""
    var createdDate: Date = Date()
    var isScrap: Bool = false
    var images = [Image("testImg"), Image("testImg2")]
    
    init(identify: String, name: String, location: String, description: String) {
        self.identify = identify
        self.name = name
        self.location = location
        self.description = description
    }
    
    func getCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: createdDate)
    }
}

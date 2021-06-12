//
//  Inventory.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

class Property: ObservableObject {
    @Published var identify = ""
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var description: String = ""
    @Published var isScrapped: Bool = false
    @Published var images = [Image("testImg"), Image("testImg2")]
    var createdDate: Date = Date()
    
    init(identify: String, name: String, location: String, description: String, isScrapped: Bool) {
        self.identify = identify
        self.name = name
        self.location = location
        self.description = description
        self.isScrapped = isScrapped
    }
    
    init() {}
    
    func getCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: createdDate)
    }
}

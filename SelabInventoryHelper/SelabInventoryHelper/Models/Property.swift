//
//  Inventory.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import FirebaseFirestoreSwift

class Property: Codable, ObservableObject {
    @DocumentID var id: String?
    var identify = ""
    var name: String = ""
    var location: String = ""
    var description: String = ""
    var isScrapped: Bool = false
//    @Published var images = [Image("testImg"), Image("testImg2")]
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

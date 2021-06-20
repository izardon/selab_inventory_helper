//
//  Inventory.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

class Property: ObservableObject {
    var documentId: String = ""
    var identify = ""
    var name: String = ""
    var location: String = ""
    var description: String = ""
    var isScrapped: Bool = false
    @Published var images = [UIImage]()
    var imageIds = [String]()
    var createdDate: Date = Date()
    
    init(documentId: String, identify: String, name: String, location: String, description: String, isScrapped: Bool, imageIds: [String]) {
        self.documentId = documentId
        self.identify = identify
        self.name = name
        self.location = location
        self.description = description
        self.isScrapped = isScrapped
        self.imageIds = imageIds
    }
    
    init() {}
    
    func addImageIds(ids: [String]) {
        imageIds.append(contentsOf: ids)
    }
    
    func getCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: createdDate)
    }
    
}

//
//  PropertyDto.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 19/06/2021.
//

import Foundation
import FirebaseFirestoreSwift

class PropertyDto: Codable {
    @DocumentID var id: String?
    var identify = ""
    var name: String = ""
    var location: String = ""
    var description: String = ""
    var isScrapped: Bool = false
    var imageIds = [String]()
    var createdDate: Date = Date()
    
    init(documentId: String, identify: String, name: String, location: String, description: String, isScrapped: Bool, imageIds: [String]) {
        self.id = documentId
        self.identify = identify
        self.name = name
        self.location = location
        self.description = description
        self.isScrapped = isScrapped
        self.imageIds = imageIds
    }
    
    init() {}
    
    func getCreatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: createdDate)
    }
}

//
//  PropertyRepository.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/12.
//

import Foundation
import Firebase

class PropertyRepository: ObservableObject {
    @Published var title: String = ""
    @Published var message: String = ""
    
    func save(property: Property) {
        let db = Firestore.firestore()
        do {
            let documentReference = try
                db.collection("properties").addDocument(from: property)
            
            self.title = "新增財產成功"
            self.message = "New Document Id is \(documentReference.documentID)"
        } catch {
            self.title = "新增財產失敗"
            print(error)
        }
    }
    
    func get (completion: @escaping ([Property]) -> ()) {
        let db = Firestore.firestore()
        db.collection("properties").order(by: "createdDate", descending: true).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                fatalError("error downloading documents")
            }
            
            var properties = [Property]()
            for document in documents{
                if let property = try? document.data(as: Property.self) {
                    properties.append(property)
                }
            }
            completion(properties)
        }
    }
}

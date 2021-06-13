//
//  PropertyRepository.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/12.
//

import Foundation
import Firebase

class PropertyRepository: ObservableObject {
    
    func save(property: Property) -> String? {
        let db = Firestore.firestore()
        
        var documentId:String?
        do {
            let documentReference = try
                db.collection("properties").addDocument(from: property)
            documentId = documentReference.documentID
        } catch {
            print(error)
        }
        
        return documentId
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
    
    func delete(property: Property) -> String? {
        let db = Firestore.firestore()
        
        var documentId:String? = property.id!
        db.collection("properties").document(property.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                documentId = nil
            }
            else {                
            }
        }
        print("documentId = \(documentId!)")
        
        return documentId
    }
}

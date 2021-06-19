//
//  PropertyRepository.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/12.
//

import Foundation
import Firebase
import FirebaseStorage

class PropertyRepository: ObservableObject {
    let db = Firestore.firestore()
    
    func save(property: Property) -> String? {
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
    
    func getById(propertyId: String, completion: @escaping (Property) -> ()){
        var property = Property()
        db.collection("properties").document(propertyId).getDocument { (document, error) in
            if let document = document, document.exists {
                property = try! document.data(as: Property.self)!
            }
            completion(property)
        }
    }
    
    func update(property: Property) -> String? {
        var documentId:String? = property.id!
        do {
            try db.collection("properties").document(documentId!).setData(from: property)
        }
        catch {
            print("Error updating document: \(error)")
            documentId = nil
        }
        
        return documentId
    }
    
    func delete(property: Property) -> String? {
        var documentId:String? = property.id!
        db.collection("properties").document(documentId!).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
                documentId = nil
            }
            else {                
            }
        }
        print("documentId = \(documentId!)")
        
        return documentId
    }
}

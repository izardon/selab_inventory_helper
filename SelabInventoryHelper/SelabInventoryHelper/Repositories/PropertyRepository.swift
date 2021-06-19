//
//  PropertyRepository.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/12.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI

class PropertyRepository: ObservableObject {
    let db = Firestore.firestore()
    
    func save(property: Property) -> String? {
        var documentId:String?
        do {
            saveImages(propertyId: property.identify, images: property.images)
            property.imageIds = obtainImageIds(propertyId: property.identify, count: property.images.count)
            let propertyDto = PropertyDtoMapper.domainToDto(property: property)
            let documentReference = try
                db.collection("properties").addDocument(from: propertyDto)
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
                if let propertyDto = try? document.data(as: PropertyDto.self) {
                    let selectedProperty = PropertyDtoMapper.dtoToDomain(propertyDto: propertyDto)
                    properties.append(selectedProperty)
                }
            }
            completion(properties)
        }
    }
    
    func getById(propertyId: String, completion: @escaping (Property) -> ()){
        var property = Property()
        db.collection("properties").document(propertyId).getDocument { (document, error) in
            if let document = document, document.exists {
                if let propertyDto = try? document.data(as: PropertyDto.self) {
                    let selectedProperty = PropertyDtoMapper.dtoToDomain(propertyDto: propertyDto)
                    property = selectedProperty
                }
            }
            completion(property)
        }
    }
    
    func update(property: Property) -> String? {
        let propertyDto = PropertyDtoMapper.domainToDto(property: property)
        var documentId:String? = propertyDto.id!
        do {
            try db.collection("properties").document(documentId!).setData(from: propertyDto)
        }
        catch {
            print("Error updating document: \(error)")
            documentId = nil
        }
        
        return documentId
    }
    
    func delete(property: Property) -> String? {
        let propertyDto = PropertyDtoMapper.domainToDto(property: property)
        var documentId:String? = propertyDto.id!
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
    
    func saveImages(propertyId: String, images: [UIImage]) {
        let storageRef = FirebaseStorage.Storage.storage().reference().child("propertyImages")
        for (index, image) in images.enumerated() {
            let imageRef = storageRef.child("\(propertyId)-\(index).png")
            let imageData = image.pngData()!
            _ = imageRef.putData(imageData, metadata: nil) { (metadata, error) in
                guard metadata != nil else {
                    return
                }
//                imageRef.downloadURL{ (url, error) in
//                    guard let downloadURL = url else {
//                        return
//                    }
//                }
            }
        }
    }
    
    func obtainImageIds(propertyId: String, count: Int) -> [String] {
        var ids = [String]()
        for index in 0..<count {
            ids.append("\(propertyId)-\(index)")
        }
        return ids
    }
}

struct PropertyRepository_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

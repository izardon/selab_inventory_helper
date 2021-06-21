//
//  InventoryLogRepository.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation
import Firebase

class InventoryLogRepository: ObservableObject {
    let db = Firestore.firestore()
    
    func save(inventoryLog: InventoryLog) -> String? {
        var documentId:String?
        do {
            let inventoryLogDto = InventoryLogDtoMapper.domainToDto(inventoryLog: inventoryLog)
            let documentReference = try
                db.collection("inventoryLogs").addDocument(from: inventoryLogDto)
            documentId = documentReference.documentID
        } catch {
            print(error)
        }
        
        return documentId
    }
    
    func getByComplete(isComplete: Bool, completion: @escaping ([InventoryLog]) -> ()){
        var inventoryLogs = [InventoryLog]()
        db.collection("inventoryLogs").whereField("isComplete", isEqualTo: isComplete).getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                fatalError("error downloading documents")
            }
            
            if !documents.isEmpty {
                if let inventoryLogDto =  try? documents[0].data(as: InventoryLogDto.self) {
                    let selectedInventoryLog = InventoryLogDtoMapper.dtoToDomain(inventoryLogDto: inventoryLogDto)
                    inventoryLogs.append(selectedInventoryLog)
                }
            }
            
            completion(inventoryLogs)
        }
    }
}

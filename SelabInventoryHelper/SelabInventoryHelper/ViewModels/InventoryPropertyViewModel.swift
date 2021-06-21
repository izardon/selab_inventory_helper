//
//  InventoryPropertyViewModel.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation

extension InventoryProperty {
    class ViewModel: ObservableObject {
        private let propertyRepo: PropertyRepository
        private let inventoryLogRepo: InventoryLogRepository
        @Published var inventoryLog: InventoryLog
        
        init() {
            self.propertyRepo = PropertyRepository()
            self.inventoryLogRepo = InventoryLogRepository()
            self.inventoryLog = InventoryLog(documentId: "", name: "test", inventoryItems: [], isComplete: false)
        }
        
        func getUnCompleteOrAddNewInventoryLog() {
            inventoryLogRepo.getByComplete(isComplete: false) { [weak self] inventoryLogs in
                DispatchQueue.main.async {
                    if(inventoryLogs.isEmpty) {
                        print("empty")
                        self?.propertyRepo.get() { [weak self] properties in
                            DispatchQueue.main.async {
                                properties.forEach({property in
                                    let inventoryItem = InventoryItem(name: property.name, id: property.identify, isChecked: false)
                                    self?.inventoryLog.inventoryItems.append(inventoryItem)
                                })
                                self?.inventoryLogRepo.save(inventoryLog: self!.inventoryLog)
                            }
                        }
                    } else {
                        self?.inventoryLog = inventoryLogs[0]
                        print("inventoryLog", self?.inventoryLog)
                    }
                    
                }
            }
            
            
            
//            print(propertyRepo.properties)
//            propertyRepo.get() { [weak self] properties in
//                DispatchQueue.main.async {
//                    print("properties", properties)
////                    self?.properties = properties
////                    self!.repo.loadImages(properties: self!.properties)
//                }
//            }
        }
    }
}


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
            self.inventoryLog = InventoryLog(documentId: "", name: "", inventoryItems: [], isComplete: false)
        }
        
        func getUnCompleteOrAddNewInventoryLog() {
            self.inventoryLog = InventoryLog(documentId: "", name: "盤點紀錄#\(self.getNowFormateString())", inventoryItems: [], isComplete: false)
            
            inventoryLogRepo.getByComplete(isComplete: false) { [weak self] inventoryLogs in
                DispatchQueue.main.async {
                    if(inventoryLogs.isEmpty) {
                        print("empty")
                        self?.propertyRepo.getAllAreNotScrapped() { [weak self] properties in
                            DispatchQueue.main.async {
                                properties.forEach({property in
                                    let inventoryItem = InventoryItem(name: property.name, id: property.identify, isChecked: false)
                                    self?.inventoryLog.inventoryItems.append(inventoryItem)
                                })
                                self?.inventoryLog.documentId = (self?.inventoryLogRepo.save(inventoryLog: self!.inventoryLog))!
                            }
                        }
                    } else {
                        self?.inventoryLog = inventoryLogs[0]
                    }
                }
            }
        }
        
        func updateInventoryLog(inventoryLog: InventoryLog) {
            inventoryLogRepo.update(inventoryLog: inventoryLog)
        }
        
        func getNowFormateString() -> String {
            let formatter = DateFormatter()
            let formate = "yyyy-MM-dd HH:mm:ss"
            formatter.dateFormat = formate
            return formatter.string(from: Date())
        }
    }
}


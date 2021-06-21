//
//  InventoryHistoryViewModel.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 21/06/2021.
//

import Foundation

extension InventoryHistory {
    class ViewModel: ObservableObject {
        private let propertyRepo: PropertyRepository
        private let inventoryLogRepo: InventoryLogRepository
        @Published var inventoryLogs: [InventoryLog]
        
        init() {
            propertyRepo = PropertyRepository()
            inventoryLogRepo = InventoryLogRepository()
            inventoryLogs = [InventoryLog]()
        }
        
        func loadLogs() {
            inventoryLogRepo.get() { [weak self] logs in
                DispatchQueue.main.async {
                    self?.inventoryLogs = logs
                }
            }
        }
    }
}

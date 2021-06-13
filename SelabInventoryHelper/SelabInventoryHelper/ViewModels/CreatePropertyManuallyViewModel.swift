//
//  CreatePropertyManuallyViewModel.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/13.
//

import Foundation

extension CreatePropertyManually {
    class ViewModel: ObservableObject {
        private let repo: PropertyRepository
        
        @Published var title: String = ""
        @Published var message: String = ""
        @Published var operationSuccess: Bool = false
        
        init() {
            self.repo = PropertyRepository()
        }
        
        func saveProperty(property: Property) {
            if let newPropertyId = repo.save(property: property) {
                self.title = "新增財產成功"
                self.message = "new document id = \(newPropertyId)"
                self.operationSuccess = true
            } else {
                self.title = "新增財產失敗"
                self.message = "請重新操作"
                self.operationSuccess = false
            }
        }
    }
}


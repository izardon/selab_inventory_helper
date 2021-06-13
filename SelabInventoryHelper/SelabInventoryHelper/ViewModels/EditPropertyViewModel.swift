//
//  EditPropertyViewModel.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/13.
//

import Foundation

extension EditProperty {
    class ViewModel: ObservableObject {
        private let repo: PropertyRepository
        @Published var property: Property
        @Published var title: String = ""
        @Published var message: String = ""
        @Published var operationSuccess: Bool = false
        
        init() {
            self.repo = PropertyRepository()
            self.property = Property()
        }
        
        func getProperty(propertyId: String) {
            print("propertyId = \(propertyId)")
            repo.getById(propertyId: propertyId) { [weak self] property in
                DispatchQueue.main.async {
                    self?.property = property
                }
            }
        }
        
        func updateProperty(property: Property) {
            if repo.update(property: property) != nil {
                self.title = "編輯財產成功"
                self.message = ""
                self.operationSuccess = true
            } else {
                self.title = "編輯財產失敗"
                self.message = "請重新操作"
                self.operationSuccess = false
            }
        }
    }
}

//
//  ListPropertyViewModel.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/12.
//

import Foundation

extension ListProperty {
    class ViewModel: ObservableObject {
        private let repo: PropertyRepository
        @Published private(set) var properties: [Property]
        
        init() {
            self.repo = PropertyRepository()
            self.properties = []
        }
        
        func loadProperties() {
            repo.get() { [weak self] properties in
                DispatchQueue.main.async {
                   self?.properties = properties
                }
             }
        }
    }
}


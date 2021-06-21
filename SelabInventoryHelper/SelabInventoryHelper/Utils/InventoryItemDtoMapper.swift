//
//  InventoryItemDtoMapper.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation

class InventoryItemDtoMapper {
    static func domainToDto(inventoryItem: InventoryItem) -> InventoryItemDto {
        return InventoryItemDto(name: inventoryItem.name, id: inventoryItem.id, isChecked: inventoryItem.isChecked)
    }
    
    static func dtoToDomain(inventoryItemDto: InventoryItemDto) -> InventoryItem {
        return InventoryItem(name: inventoryItemDto.name, id: inventoryItemDto.id, isChecked: inventoryItemDto.isChecked)
    }
}

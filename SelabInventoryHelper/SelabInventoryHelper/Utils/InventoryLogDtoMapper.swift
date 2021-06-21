//
//  InventoryLogDtoMapper.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/21.
//

import Foundation

class InventoryLogDtoMapper {
    static func domainToDto(inventoryLog: InventoryLog) -> InventoryLogDto {
        var inventoryItemDtos: [InventoryItemDto] = []
        inventoryLog.inventoryItems.forEach({inventoryItem in
            inventoryItemDtos.append(InventoryItemDtoMapper.domainToDto(inventoryItem: inventoryItem))
        })
        return InventoryLogDto(documentId: inventoryLog.documentId, name: inventoryLog.name, inventoryItems: inventoryItemDtos, isComplete: inventoryLog.isComplete)
    }
    
    static func dtoToDomain(inventoryLogDto: InventoryLogDto) -> InventoryLog {
        var inventoryItems: [InventoryItem] = []
        inventoryLogDto.inventoryItems.forEach({inventoryItemDto in
            inventoryItems.append(InventoryItemDtoMapper.dtoToDomain(inventoryItemDto: inventoryItemDto))
        })
        return InventoryLog(documentId: inventoryLogDto.id!, name: inventoryLogDto.name, inventoryItems: inventoryItems, isComplete: inventoryLogDto.isComplete)
    }
}

//
//  PropertyDtoMapper.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 19/06/2021.
//

import Foundation

class PropertyDtoMapper {
    static func domainToDto(property: Property) -> PropertyDto {
        return PropertyDto(identify: property.identify, name: property.name, location: property.location, description: property.description, isScrapped: property.isScrapped, imageIds: property.imageIds)
    }
    
    static func dtoToDomain(propertyDto: PropertyDto) -> Property {
        return Property(identify: propertyDto.identify, name: propertyDto.name, location: propertyDto.location, description: propertyDto.description, isScrapped: propertyDto.isScrapped, imageIds: propertyDto.imageIds)
    }
}

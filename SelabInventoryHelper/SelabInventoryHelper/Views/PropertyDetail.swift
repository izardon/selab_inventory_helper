//
//  InventoryDetail.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

struct PropertyDetail: View {
    public var property: Property
    
    @State private var imgIndex = 0
    @State private var isEditing = false
//    @State private var images = [Image("testImg"), Image("testImg2")]
    
    var btnEdit : some View {
        NavigationLink(destination: EditProperty(viewModel: EditProperty.ViewModel(), property: property), label: {
            Text("Edit")
        })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Text("財產編號：\(property.identify)")
                    .padding(.vertical, 10)
                Text("新增時間：\(property.getCreatedDate())")
                    .padding(.vertical, 10)
                Text("財產名稱：\(property.name)")
                    .padding(.vertical, 10)
                Text("存放地點：\(property.location)")
                    .padding(.vertical, 10)
                Text("財產描述：\(property.description)")
                    .padding(.vertical, 10)
                
                if(!property.images.isEmpty) {
                    HStack {
                        ImageSlider(index: $imgIndex.animation(), maxIndex: property.images.count - 1) {
                            ForEach(0..<property.images.count, id: \.self) { idx in
                                Image(uiImage: property.images[idx])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .aspectRatio(4/3, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                    .padding(10)
                }
            }
            .navigationTitle("View")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: btnEdit)
        }
    }
}

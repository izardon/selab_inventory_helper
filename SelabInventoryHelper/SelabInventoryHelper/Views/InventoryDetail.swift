//
//  InventoryDetail.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

struct InventoryDetail: View {
    let inventory: Inventory
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var imgIndex = 0
    var images = ["testImg", "testImg2"]
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Text("Back")
        }
    }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("財產編號：\(inventory.identify)")
                    .font(.largeTitle)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 0))
            
            Text("新增時間：\(inventory.getCreatedDate())")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 0))
            
            Text("財產名稱：\(inventory.name)")
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            
            Text("存放地點：\(inventory.location)")
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            
            Text("財產描述：\(inventory.description)")
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            
            Spacer()
            
            HStack {
                ImageSlider(index: $imgIndex.animation(), maxIndex: images.count - 1) {
                    ForEach(self.images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 50))
                .aspectRatio(4/3, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
            }
            
            
            
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .navigationTitle(inventory.identify)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: btnBack)
    }
}

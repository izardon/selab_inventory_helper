//
//  InventoryEdit.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

struct InventoryEdit: View {
    @State public var inventory: Inventory
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var imgIndex = 0
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var images = [Image("testImg"), Image("testImg2")]
    @State private var uploadImage: Image? = Image("testImg")
    
    
    var btnBack : some View {
        NavigationLink(destination: InventoryDetail(inventory: inventory), label: {
            Text("Detail")
        })
    }
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            HStack {
                TextField("財產編號：", text: $inventory.identify)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .font(.largeTitle)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))
            
            Text("新增時間：\(inventory.getCreatedDate())")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            
            TextField("名稱編號：", text: $inventory.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            TextField("存放地點：", text: $inventory.location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .font(.title2)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            HStack {
                TextEditor(text: $inventory.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth:  2)
                    )
                    .font(.title2)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            
            
            Spacer()
            
            HStack {
                ImageSlider(index: $imgIndex.animation(), maxIndex: images.count - 1) {
                    ForEach(0..<images.count, id: \.self) { idx in
                        images[idx]
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .aspectRatio(4/3, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
                
                Button(action: {
                    self.shouldPresentActionScheet = true
                }, label:{
                    Image(systemName: "person.2.square.stack")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                })
                .sheet(isPresented: $shouldPresentImagePicker) {
                    SUImagePicker(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$uploadImage, images: self.$images, isPresented: self.$shouldPresentImagePicker)
                }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = true
                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = false
                    }), ActionSheet.Button.cancel()])
                }
                
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

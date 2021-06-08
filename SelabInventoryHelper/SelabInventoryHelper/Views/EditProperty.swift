//
//  InventoryEdit.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

struct EditProperty: View {
    @State public var property: Property
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var imgIndex = 0
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var images = [Image("testImg"), Image("testImg2")]
    @State private var uploadImage: Image? = Image("testImg")
    
    
    var btnBack : some View {
        NavigationLink(destination: PropertyDetail(property: property), label: {
            Text("Detail")
        })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                TextField("財產編號", text: $property.identify)
                    .padding(.vertical, 10)
                TextField("財產名稱", text: $property.name)
                    .padding(.vertical, 10)
                TextField("存放地點", text: $property.location)
                    .padding(.vertical, 10)
                TextArea("財產描述", text: $property.description)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 100,
                        maxHeight: .infinity
                    )
                    .padding(.vertical, 10)
                
                HStack {
                    ImageSlider(index: $imgIndex.animation(), maxIndex: images.count - 1) {
                        ForEach(0..<images.count, id: \.self) { idx in
                            images[idx]
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture { self.shouldPresentActionScheet = true }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .aspectRatio(4/3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
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
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .padding(10)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("儲存")
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 50,
                            maxHeight: .infinity,
                            alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                        )
                        .foregroundColor(.white)
                })
                .background(Color(red: 71 / 255, green: 82 / 255, blue: 94 / 255))
                .cornerRadius(20)
            }
        }
        .navigationTitle(property.identify)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: btnBack)
    }
}

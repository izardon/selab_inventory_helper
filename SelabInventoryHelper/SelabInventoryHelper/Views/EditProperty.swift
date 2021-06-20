//
//  InventoryEdit.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/7.
//

import Foundation
import SwiftUI

struct EditProperty: View {
    @ObservedObject var viewModel: ViewModel
    @StateObject public var property: Property
    @State private var imgIndex = 0
//    @State private var shouldPresentImagePicker = false
//    @State private var shouldPresentActionScheet = false
//    @State private var shouldPresentCamera = false
//    @State private var images = [Image("testImg"), Image("testImg2")]
//    @State private var uploadImage: Image? = Image("testImg")
    @State private var showingSaveAlert: Bool = false
    @State private var isShowingImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
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
                    if (!property.images.isEmpty) {
                        ImageSlider(index: $imgIndex.animation(), maxIndex: property.images.count - 1) {
                            ForEach(property.images.indices, id: \.self) { index in
                                (Image(uiImage: property.images[index]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .aspectRatio(4/3, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    } else {
                        Text("Click icon to uplad an image")
                            .foregroundColor(.gray)
                    }
                    Button(action: {
                        self.isShowingImagePicker = true
                    }, label: {
                        Image(systemName: "plus.square.on.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .trailing)
                            .foregroundColor(.blue)
                    })
                    .padding()
                    
                    //                    ImageSlider(index: $imgIndex.animation(), maxIndex: images.count - 1) {
                    //                        ForEach(0..<images.count, id: \.self) { idx in
                    //                            images[idx]
                    //                                .resizable()
                    //                                .aspectRatio(contentMode: .fit)
                    //                                .onTapGesture { self.shouldPresentActionScheet = true }
                    //                        }
                    //                    }
                    //                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    //                    .aspectRatio(4/3, contentMode: .fit)
                    //                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    //                    .shadow(radius: 5)
                    //                    .sheet(isPresented: $shouldPresentImagePicker) {
                    //                        SUImagePicker(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$uploadImage, images: self.$images, isPresented: self.$shouldPresentImagePicker)
                    //                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                    //                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                    //                            self.shouldPresentImagePicker = true
                    //                            self.shouldPresentCamera = true
                    //                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                    //                            self.shouldPresentImagePicker = true
                    //                            self.shouldPresentCamera = false
                    //                        }), ActionSheet.Button.cancel()])
                    //                    }
                    
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .padding(10)
                
                Button(action: {
                    viewModel.updateProperty(property: property)
                    showingSaveAlert = true
                }, label: {
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
                .alert(isPresented: $showingSaveAlert) {
                    Alert(
                        title: Text(viewModel.title),
                        message: Text(viewModel.message),
                        dismissButton: .default(Text("確定"), action: {
                            
                        })
                    )
                }
                .background(Color(red: 71 / 255, green: 82 / 255, blue: 94 / 255))
                .cornerRadius(20)
            }
        }
        .navigationTitle("Edit")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage, content: {
            ImagePicker(image: self.$inputImage)
        })
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.property.images.append(inputImage)
    }
}

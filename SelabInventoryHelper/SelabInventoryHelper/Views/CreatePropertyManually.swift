//
//  CreatePropertyManually.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct CreatePropertyManually: View {
    @State private var property: Property = Property()
    @State var imgIndex = 0
    @State private var images = []
    @State private var isShowingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            Form {
                TextField("財產編號", text: $property.identify)
                    .padding(.vertical, 10)
                TextField("財產名稱", text: $property.name)
                    .padding(.vertical, 10)
                TextField("存放地點", text: $property.location)
                    .padding(.vertical, 10)
                TextField("財產描述", text: $property.description)
                    .padding(.vertical, 10)
                HStack {
                    if (!images.isEmpty) {
                        ImageSlider(index: $imgIndex.animation(), maxIndex: images.count - 1) {
                            ForEach(images.indices, id: \.self) { index in
                                (images[index] as! Image)
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
                }
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
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage, content: {
            ImagePicker(image: self.$inputImage)
        })
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        images.append(Image(uiImage: inputImage))
//        images.append(Image("inventory"))
    }
}

struct CreatePropertyManually_Previews: PreviewProvider {
    static var previews: some View {
        CreatePropertyManually()
    }
}

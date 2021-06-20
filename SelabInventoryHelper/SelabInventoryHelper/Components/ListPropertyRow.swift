//
//  ListInUseProperty.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/8.
//

import Foundation
import SwiftUI



struct ListPropertyRow: View {
    @ObservedObject var viewModel: ListProperty.ViewModel
    @ObservedObject var property: Property
    @State public var isScrapped: Bool
    @State private var showingScrapAlert = false
    @State private var showingTrashAlert = false
    
    var body: some View {
        NavigationLink(destination: PropertyDetail(property: property)) {
            HStack {
                if (property.images.count < 1) {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                } else {
                    Image(uiImage: property.images[0])
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                Text("\(property.images.count)")
                
                VStack(alignment: .leading) {
                    Text(property.identify)
                        .font(.title2)
                    Text(property.name)
                        .font(.body)
                    Text(property.location)
                        .font(.body)
                }
                
                Spacer()
                
                if isScrapped {
                    VStack {
                        Spacer()
                        Image(systemName: "tray.and.arrow.up")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                print("tray.and.arrow.up")
                                showingScrapAlert = true
                            }
                            .alert(isPresented: $showingScrapAlert) {
                                Alert(
                                    title: Text("取消報廢這筆財產？"),
                                    message: Text("可再報廢"),
                                    primaryButton: .destructive(Text("確定")) {
                                        print("tray.and.arrow.up...")
                                    },
                                    secondaryButton: .cancel(Text("取消"))
                                )
                            }
                        
                        Spacer()
                    }
                } else {
                    VStack {
                        Spacer()
                        Image(systemName: "tray.and.arrow.down")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                print("tray.and.arrow.down")
                                showingScrapAlert = true
                            }
                            .alert(isPresented: $showingScrapAlert) {
                                Alert(
                                    title: Text("報廢這筆財產？"),
                                    message: Text("可再還原"),
                                    primaryButton: .destructive(Text("報廢")) {
                                        print("Archivebox...")
                                    },
                                    secondaryButton: .cancel(Text("取消"))
                                )
                            }
                        
                        Spacer()
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                            .onTapGesture {
                                print("trash")
                                showingTrashAlert = true
                            }
                            .alert(isPresented: $showingTrashAlert) {
                                Alert(
                                    title: Text("確定要刪除這筆財產？"),
                                    message: Text("無法還原"),
                                    primaryButton: .destructive(Text("刪除")) {
                                        viewModel.deleteProperty(property: property)
                                        print("Deleting...")
                                    },
                                    secondaryButton: .cancel(Text("取消"))
                                )
                            }
                        
                        Spacer()
                    }
                }
            }            
        }
    }
}


struct ListInUsePropertyView_Previews: PreviewProvider {
    static var previews: some View {
        ListPropertyRow(viewModel: ListProperty.ViewModel(), property: Property(identify: "A123", name: "電腦", location: "宏裕科技大樓1421", description: "有顯卡", isScrapped: false, imageIds: [String]()), isScrapped: false)
    }
}

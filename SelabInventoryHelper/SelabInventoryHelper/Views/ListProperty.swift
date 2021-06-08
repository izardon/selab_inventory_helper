//
//  PropertyListView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/6.
//

import Foundation
import SwiftUI

struct ListProperty: View {
    @State private var isEditing = false
    @State private var selectedTab: Int = 0
    @State private var searchText: String = ""
    @State private var showingAlert = false
    
    let inventories = [Property(identify: "A123", name: "電腦", location: "宏裕科技大樓1421", description: "有顯卡"), Property(identify: "B647", name: "手機", location: "宏裕科技大樓1624", description: "samsung")]
    
    var body: some View {
        NavigationView {
            List {
                SearchBar(searchText: $searchText)
                HStack {
                    Picker(selection: $selectedTab, label: Text("Color")) {
                        Text("未報廢").tag(0)
                        Text("已報廢").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                ForEach(inventories, id: \.identify) { (inventory) in
                    HStack {
                        NavigationLink(destination: PropertyDetail(inventory: inventory)) {
                            HStack {
                                Image("testImg")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                VStack(alignment: .leading) {
                                    Text(inventory.identify)
                                        .font(.title)
                                    Text(inventory.name)
                                        .font(.title3)
                                    Text(inventory.location)
                                        .font(.title3)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Spacer()
                                    Image(systemName: "archivebox")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                        .onTapGesture {
                                            print("archivebox")
                                            showingAlert = true
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(
                                                title: Text("確定要報廢這筆財產？"),
                                                message: Text("可再取消報廢"),
                                                primaryButton: .destructive(Text("報廢")) {
                                                    print("Archivebox...")
                                                },
                                                secondaryButton: .cancel(Text("取消"))
                                            )
                                        }
                                    
                                    Spacer()
                                    Image(systemName: "trash")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red)
                                        .onTapGesture {
                                            print("trash")
                                            showingAlert = true
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(
                                                title: Text("確定要刪除這筆財產？"),
                                                message: Text("無法還原"),
                                                primaryButton: .destructive(Text("刪除")) {
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
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}


struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        ListProperty()
    }
}

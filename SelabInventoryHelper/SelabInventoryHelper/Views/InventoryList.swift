//
//  PropertyListView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/6.
//

import Foundation
import SwiftUI

struct InventoryList: View {
    @State private var isEditing = false
    @State private var selection = 2
    @State private var searchText: String = ""
    
    let inventories = [Inventory(identify: "A123", name: "電腦", location: "宏裕科技大樓1421", description: "有顯卡"), Inventory(identify: "B647", name: "手機", location: "宏裕科技大樓1624", description: "samsung")]
    
    var body: some View {
        NavigationView {
            List {
                SearchBar(searchText: $searchText)
                ForEach(inventories, id: \.identify) { (inventory) in
                    HStack {
                        NavigationLink(destination: InventoryDetail(inventory: inventory)) {
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
                                    Spacer()
                                    Image(systemName: "trash")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red)
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
        InventoryList()
    }
}

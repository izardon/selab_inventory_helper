//
//  PropertyListView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/6.
//

import Foundation
import SwiftUI

struct InventoryList: View {
    @State private var selection = 2
    @State private var searchText: String = ""
    let inventories = [Inventory(identify: "A123", name: "電腦", location: "1421", description: "有顯卡")]
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            
            NavigationView {
                List(inventories, id: \.identify) { (inventory) in
                    HStack {
                        NavigationLink(destination: InventoryDetail(name: inventory.name)) {
                            HStack {
                                Image("testImg")
                                    .resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                VStack {
                                    Text(inventory.identify)
                                        .font(.title)
                                    Text(inventory.name)
                                        .font(.title3)
                                    Text(inventory.location)
                                        .font(.title3)
                                }
                                
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
//            List(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
//                Text(item.name)
//            }
            
        }
        
        
    }
}


struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryList()
    }
}

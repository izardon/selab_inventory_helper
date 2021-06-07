//
//  PropertyListView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/6.
//

import Foundation
import SwiftUI

struct PropertyListView: View {
    @State private var selection = 2
    
    var body: some View {
        VStack {
            TabView(selection:$selection) {
                Color.yellow
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("新增財產")
                    }
                    .tag(0)
                Color.blue
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("盤點財產")
                    }.tag(1)
                Color.green
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("檢視財產")
                    }.tag(2)
            }
        }
        
        
    }
}


struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListView()
    }
}

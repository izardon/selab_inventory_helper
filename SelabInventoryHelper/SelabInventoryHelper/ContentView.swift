//
//  ContentView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/5.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    
    var body: some View {
        VStack {
            TabView(selection:$selection) {
                CreateProperty()
                    .tabItem {
                        Label(
                            title: { Text("新增財產") },
                            icon: { Image(systemName: "plus.app") }
                        )
                    }
                    .tag(0)
                InventoryTaking()
                    .tabItem {
                        Label(
                            title: { Text("盤點財產") },
                            icon: { Image(systemName: "square.and.pencil") }
                        )
                    }
                    .tag(1)
                ListProperty()
                    .tabItem {
                        Label(
                            title: { Text("檢視財產") },
                            icon: { Image(systemName: "magnifyingglass") }
                        )
                    }
                    .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  CreateProperty.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct CreateProperty: View {
    @State private var selection = 1
    
    var body: some View {
        VStack {
            TabView(selection:$selection) {
                Color.yellow
                    .tabItem {
                        Text("條碼掃描")
                            .font(.title2)
                    }
                    .tag(0)
                Color.white
                    .tabItem {
                        Text("手動輸入")
                    }
                    .tag(1)
            }
        }
    }
}

struct CreateProperty_Previews: PreviewProvider {
    static var previews: some View {
        CreateProperty()
    }
}

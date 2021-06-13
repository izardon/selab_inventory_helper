//
//  CreateProperty.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct CreateProperty: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("條碼掃描").tag(0)
                Text("手動輸入").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch(selectedTab) {
            case 0: Color.yellow
                .ignoresSafeArea()
            case 1: CreatePropertyManually(viewModel: CreatePropertyManually.ViewModel())
            default:
                Color.red
                    .ignoresSafeArea()
            }
        }
    }
}

struct CreateProperty_Previews: PreviewProvider {
    static var previews: some View {
        CreateProperty()
    }
}

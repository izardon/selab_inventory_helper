//
//  PropertyListView.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/6.
//

import Foundation
import SwiftUI
import Firebase

struct ListProperty: View {
    @ObservedObject var viewModel: ViewModel
    @State private var isScrapped: Bool = false
    @State private var searchText: String = ""
    //    let properties = [Property(identify: "A123", name: "電腦", location: "宏裕科技大樓1421", description: "有顯卡", isScrapped: false), Property(identify: "B647", name: "手機", location: "宏裕科技大樓1624", description: "", isScrapped: false), Property(identify: "G964", name: "電腦", location: "宏裕科技大樓1421", description: "20年老電腦", isScrapped: true)]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    SearchBar(searchText: $searchText)
                    
                    HStack {
                        Picker("", selection: $isScrapped) {
                            Text("使用中").tag(false)
                            Text("已報廢").tag(true)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    ForEach(viewModel.properties, id: \.identify) { (property) in
                        if property.isScrapped == isScrapped && (searchText.isEmpty ? true : property.identify.contains(searchText))  {
                            ListPropertyRow(viewModel: viewModel, property: property, isScrapped: isScrapped)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .onAppear(perform: {
                    self.viewModel.loadProperties()
                })
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}


struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        ListProperty(viewModel: ListProperty.ViewModel())
    }
}

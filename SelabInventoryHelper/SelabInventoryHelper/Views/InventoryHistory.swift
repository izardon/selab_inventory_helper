//
//  InventoryHistory.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 18/06/2021.
//

import SwiftUI

struct InventoryHistory: View {
    @ObservedObject var viewModel: ViewModel
    @State var searchText: String = ""
//    @State var logs: [InventoryLog]
    
    var body: some View {
        VStack (alignment: .leading){
            SearchBar(searchText: $searchText)
                .padding(.bottom, 15)
            List(viewModel.inventoryLogs, id: \.documentId) { (log) in
                ScrollView {
                    InventoryHistoryRow(viewModel: viewModel, log: log)
                        .padding(.leading, 10)
                        .padding(.vertical, 10)
                }
            }
            .onAppear(perform: {
                self.viewModel.loadLogs()
            })
            Spacer()
        }
        .navigationTitle("盤點紀錄")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InventoryHistory_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            InventoryHistory(viewModel: InventoryHistory.ViewModel())
            }
        }
}

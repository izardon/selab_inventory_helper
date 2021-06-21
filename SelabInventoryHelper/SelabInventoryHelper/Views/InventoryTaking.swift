//
//  InventoryTaking.swift
//  SelabInventoryHelper
//
//  Created by 王方顯 on 07/06/2021.
//

import SwiftUI

struct InventoryTaking: View {
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                NavigationLink(
                    destination: InventoryProperty(viewModel: InventoryProperty.ViewModel()),
                    label: {
                        ButtonWithImage(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7, text: "立即盤點", textSize: 26, image: "inventory", action: {})
                    })

                NavigationLink(
                    destination: InventoryHistory(viewModel: InventoryHistory.ViewModel(), searchText: ""),
                    label: {
                        ButtonWithImage(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7,  text: "盤點紀錄", textSize: 26, image: "book", action: {})
                    })
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InventoryTaking_Previews: PreviewProvider {
    static var previews: some View {
        InventoryTaking()
    }
}

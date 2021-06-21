//
//  BarcodeSanner.swift
//  SelabInventoryHelper
//
//  Created by 詹昆宬 on 2021/6/19.
//

import Foundation
import SwiftUI
import CarBode
import AVFoundation //import to access barcode types you want to scan

struct CreatePropertyBarcodeScanner: View {
    @Binding var selectedTab: Int
    @Binding var property: Property

    
    var body: some View {
        VStack {
            CBScanner(
                supportBarcode: .constant([.qr, .ean13, .ean8]), //Set type of barcode you want to scan
                scanInterval: .constant(5.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                property.identify = $0.value
                selectedTab = 1
            }
//            onDraw: {
//                //print("Preview View Size = \($0.cameraPreviewView.bounds)")
//                //print("Barcode Corners = \($0.corners)")
//
//                //line width
//                let lineWidth: CGFloat = 2
//
//                //line color
//                let lineColor = UIColor.red
//
//                //Fill color with opacity
//                //You also can use UIColor.clear if you don't want to draw fill color
//                let fillColor = UIColor(red: 0, green: 1, blue: 0.2, alpha: 0.4)
//
//                //Draw box
//                $0.draw(lineWidth: lineWidth, lineColor: lineColor, fillColor: fillColor)
//            }
        }
    }
}



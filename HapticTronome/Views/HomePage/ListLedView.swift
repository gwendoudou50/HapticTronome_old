//
//  ListLedView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 08/02/2022.
//

import SwiftUI

struct ListLedView: View {
    
    @Binding var secondLapsed: Int
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: 57) {
            ForEach(0..<4) { led in
                if secondLapsed == led {
                    LedView(color: .red)
                } else {
                    LedView(color: .white)
                }
            }
        }
        .frame(height: 100)
    }
}

//struct ListLedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListLedView()
//    }
//}

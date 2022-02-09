//
//  ListLedView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 08/02/2022.
//

import SwiftUI

struct ListLedView: View {
    
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: 57) {
            ForEach(0..<4) { led in
                LedView()
            }
        }
        .frame(height: 100)
    }
}

struct ListLedView_Previews: PreviewProvider {
    static var previews: some View {
        ListLedView()
    }
}

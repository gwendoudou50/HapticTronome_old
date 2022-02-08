//
//  LedView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 08/02/2022.
//

import SwiftUI

struct LedView: View {
    var color: Color = .white
    var body: some View {
        Image(systemName: "circle")
            .foregroundColor(color)
            .frame(width: 41, height: 41)
            .background(
                ZStack {
                    color
                    
                    Circle()
                        .foregroundColor(.black).opacity(0.25)
                        .blur(radius: 4)
                        .offset(x: 8, y: 8)
                    
                    Circle()
                        .foregroundColor(.black).opacity(0.25)
                        .blur(radius: 4)
                        .offset(x: 0, y: -8)
                    
                    Circle()
                        .foregroundColor(color)
                        .padding(2)
                        .blur(radius: 2)
                        
                }
            ).clipShape(Circle())
    }
}



struct LedView_Previews: PreviewProvider {
    static var previews: some View {
        LedView()
    }
}

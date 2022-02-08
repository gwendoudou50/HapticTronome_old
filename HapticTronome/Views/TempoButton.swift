//
//  TempoButton.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 08/02/2022.
//

import SwiftUI

struct TempoButton: View {
    var body: some View {
        
        ZStack {
            
            //Circle
            Image(systemName: "circle")
                .foregroundColor(.red)
                .frame(width: 166, height: 166)
                .background(
                    ZStack {
                        Color.red
                        
                        Circle()
                            .foregroundColor(.black).opacity(0.25)
                            .blur(radius: 5)
                            .offset(x: 0, y: -8)
                        
                        Circle()
                            .foregroundColor(.black).opacity(0.25)
                            .blur(radius: 3)
                            .offset(x: 8, y: 8)
                        
                        Circle()
                            .foregroundColor(.red)
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
            .clipShape(Circle())
            
            //Pointer
            Pointer()
                .offset(x: 0, y: -55.5)
        }
    }
}

struct TempoButton_Previews: PreviewProvider {
    static var previews: some View {
        TempoButton()
    }
}

struct Pointer: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(.black)
                .frame(width: 8, height: 55)
            
            Rectangle()
                .foregroundColor(.white)
                .blur(radius: 1)
                .clipShape(Rectangle())
                .frame(width: 5, height: 52)
        }
    }
}

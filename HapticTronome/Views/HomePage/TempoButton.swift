//
//  TempoButton.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 08/02/2022.
//

import SwiftUI

let pointerWidth: CGFloat = 8
let pointerHeight: CGFloat = 55

struct TempoButton: View {
    
    // taille de l'ecran
    var width = UIScreen.main.bounds.width / 2
    
    @ObservedObject var homeData = HomeViewModel()
    
    
    var body: some View {
        
        ZStack {
            //Circle
            Image(systemName: "circle")
                .foregroundColor(.red)
                .frame(width: width - 14, height: width - 14)
            // inner shadows
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
            .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 2)
            
            //Pointer
            Pointer()
                .rotationEffect(.init(degrees: -90))
            // moving view to left...
                .offset(x: (width - 70) / 2)
                .rotationEffect(.init(degrees: homeData.angle))
            // adding gesture
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged(homeData.onChanged(value:))
                )
            // rotating to start point...
            // 240 - 30 = 210
                .rotationEffect(.init(degrees: -210))            
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
                .frame(width: pointerWidth, height: pointerHeight)
            
            Rectangle()
                .foregroundColor(.white)
                .blur(radius: 1)
                .clipShape(Rectangle())
                .frame(width: pointerWidth - 3, height: pointerHeight - 3)
        }
    }
}

//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Button {
//            print("Play button was tapped")
//        } label: {
//            Text("Play")
//        }.buttonStyle(ButtonAction())
        
        VStack {
            Text("Button")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
                .background(
                    ZStack {
                        Color.red.opacity(0.7)
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(.white).opacity(0.7)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(.black).opacity(0.7)
                            .blur(radius: 4)
                            .offset(x: 8, y: 8)
                        
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(.red)
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                .shadow(color: Color.black, radius: 20, x: 20, y: 20)
//            .shadow(color: Color.white, radius: 20, x: -20, y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

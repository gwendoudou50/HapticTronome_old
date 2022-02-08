//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // LED
            HStack{
                
                    
            }
            
            
            
            // Buttons Action
            HStack {
                Button {
                    print("Play button was tapped")
                } label: {
                    Image(systemName: "play")
            }.buttonStyle(ButtonAction())
                
                Spacer()
                
                Button {
                    print("Settings button was tapped")
                } label: {
                    Text("4/4")
                }.buttonStyle(ButtonAction())
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

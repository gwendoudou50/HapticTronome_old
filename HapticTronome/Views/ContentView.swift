//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Button {
                print("Play button was tapped")
            } label: {
                Image(systemName: "play")
        }.buttonStyle(ButtonAction())
            
            Button {
                print("Settings button was tapped")
            } label: {
                Text("4/4")
            }.buttonStyle(ButtonAction())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

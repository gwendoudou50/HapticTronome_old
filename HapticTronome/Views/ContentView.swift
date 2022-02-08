//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Play button was tapped")
        } label: {
            Image(systemName: "play")
        }.buttonStyle(ButtonAction())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

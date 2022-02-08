//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                //LED
                ListLedView()
                    .navigationTitle("HapticTronome")
                
                Spacer()
                
                //Logo
                Image("HapticTronomeLogoBis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 203, height: 203)
                    
                            
                Spacer()
                           
                
                //Buttons Action
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
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 246 / 255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 2)
                    .padding(-10)
            
                Spacer()
                
                //Logo
                Image("HapticTronomeLogoBis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 203, height: 203)
                    
                            
                Spacer()
                        
                //Tempo Button
                VStack {
                    VStack {
                        Text("40")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("BPM")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    
                    
                    ZStack {
                        TempoButton()
                            .rotationEffect(.init(degrees: -120))
                        Graduate()
                    }
                    .padding()
                    .padding(.bottom, -50)
                    
                    HStack {
                        Text("40")
                            .padding(.horizontal, 75)
                        Text("400")
                            .padding(.horizontal,75)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
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
                .offset(y: -40)
            }
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 246 / 255))
            .navigationTitle("HapticTronome")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HomeView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 09/02/2022.
//

import SwiftUI

let BPM_MIN = 40
let BPM_MAX = 400

struct HomeView: View {
    
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // LED
                ListLedView()
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 2)
                    .padding(-10)
            
                Spacer()
                
                // Logo
                Image("HapticTronomeLogoBis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 203, height: 203)
                    
                            
                Spacer()
                        
                // Tempo Button
                VStack {
                    VStack {
//                        Text(String(format: "%.0f", 40 + homeData.progress * (400 - 40)))
                        Text("\(Int(40 + homeData.progress * (400 - 40)))")
                        .font(.title)
                            .fontWeight(.bold)

                        Text("BPM")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    
                    
                    ZStack {
                        TempoButton(homeData: homeData)
                        Graduate()
                    }
                    .padding()
                    .padding(.bottom, -50)
                    
                    HStack {
                        Text("\(BPM_MIN)")
                            .padding(.horizontal, 75)
                        Text("\(BPM_MAX)")
                            .padding(.horizontal,75)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
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
                .offset(y: -40)
            }
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 246 / 255))
            .navigationTitle("HapticTronome")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Changing the background color of the TabBar
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)        
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Lecteur", systemImage: "metronome")
                }

            SettingsView()
                .tabItem {
                    Label("Paramètres", systemImage: "gear")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}

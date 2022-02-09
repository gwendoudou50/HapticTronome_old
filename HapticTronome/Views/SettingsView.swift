//
//  SettingsView.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 09/02/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isSons = true
    @State private var isDisplay = true
    @State private var isDark = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Section {
                    VStack {
                        Toggle("Sons", isOn: $isSons)
                            .padding(.top, -5)
                        Divider()
                        Toggle("Écran toujours allumé", isOn: $isDisplay)
                        Divider()
                        Toggle("Thème sombre", isOn: $isDark)
                            .padding(.bottom, -5)
                    }
                        .padding()
                        .background(.white)
                    .cornerRadius(10)
                }
                .padding()
                
                
                List(0..<1) { item in
                    NavigationLink(destination: ContentView()) {
                        Text("Langue")
                            .foregroundColor(.black)
                        Spacer()
                        Text("Français (fr)")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                    .background(.white)
                    .cornerRadius(10)
                }
            }
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 246 / 255))
            .navigationTitle("Parmètres")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

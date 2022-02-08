//
//  ButtonAction.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 07/02/2022.
//

import SwiftUI

struct ButtonAction: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            Rectangle()
                .fill(Color.red)
                .frame(width: 55, height: 55)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 20)
                )
                .border(Color.blue)
                
        }
    }
}


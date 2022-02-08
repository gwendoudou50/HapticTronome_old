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
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
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
        }
    }
}


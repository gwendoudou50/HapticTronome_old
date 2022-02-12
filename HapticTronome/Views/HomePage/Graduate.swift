//
//  Graduate.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 09/02/2022.
//

import SwiftUI

struct Graduate: View {
    // maxAngle = 280 because 7 * 40 = 280
    
//    let width: CGFloat = 166
    var width = UIScreen.main.bounds.width / 2
    
    var body: some View {
        ZStack {
            ForEach (0...6, id: \.self) { index in
                Triangle()
                    .fill(.red)
                    .frame(width: 7, height: 10)
                    .rotationEffect(.degrees(-90))
                // moving view left
                // and rotating view as per angle...
                    .offset(x: -(width + 10) / 2)
                    .rotationEffect(.init(degrees: Double(index) * 40))
            }
            .rotationEffect(.init(degrees: -30))
        }
    }
}

struct Graduate_Previews: PreviewProvider {
    static var previews: some View {
        Graduate()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

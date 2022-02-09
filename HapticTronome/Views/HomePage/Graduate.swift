//
//  Graduate.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 09/02/2022.
//

import SwiftUI

struct Graduate: View {
    
    let width: CGFloat = 166
    
    var body: some View {
        ZStack {
            ForEach (1..<8) { index in
                Triangle()
                    .fill(.red)
                    .frame(width: 7, height: 10)
                    .offset(y: -(width - (width / 2) + 10))
                    .rotationEffect(.init(degrees: Double(index * 40)))
                    .rotationEffect(.init(degrees: 199.5))
            }
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

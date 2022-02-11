//
//  HapticTronome.swift
//  HapticTronome
//
//  Created by Gwendal Aubé on 11/02/2022.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var progress: CGFloat = 0
    @Published var angle: Double = 0
    

}

//
//  Activity.swift
//  GROUP8_Tourism
//
//  Created by Julia Prats on 2024-02-12.
//

import Foundation
import SwiftUI

class Activity: Identifiable {
    let id = UUID()
    
    let name: String
    let pricePerPerson: Double
    let imageName: String

    init(name: String, pricePerPerson: Double, imageName: String) {
        self.name = name
        self.pricePerPerson = pricePerPerson
        self.imageName = imageName
    }
}

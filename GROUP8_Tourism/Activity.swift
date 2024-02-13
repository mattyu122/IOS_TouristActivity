//
//  Activity.swift
//  GROUP8_Tourism
//
//  Created by Julia Prats on 2024-02-12.
//

import Foundation
import SwiftUI

class Activity: Identifiable, Equatable {
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    
    let name: String
    let pricePerPerson: Double
    let imageName: String
    let description: String
    let starRating: Int
    let hostName: String
    let photo: [String]
    let contact: String

    init(name: String, pricePerPerson: Double, imageName: String, description:String, starRating: Int, hostName: String, photo:[String], contact:String) {
        self.description = description
        self.starRating = starRating
        self.hostName = hostName
        self.photo = photo
        self.name = name
        self.pricePerPerson = pricePerPerson
        self.imageName = imageName
        self.contact = contact
    }
}

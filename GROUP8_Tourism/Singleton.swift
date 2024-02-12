//
//  Singleton.swift
//  GROUP8_Tourism
//
//  Created by Julia Prats on 2024-02-12.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    
    private let activities: [Activity] = [
        Activity(name: "Activity1", pricePerPerson: 25.0, imageName: "Image"),
        Activity(name: "Activity2", pricePerPerson: 20.0, imageName: "Image"),
        Activity(name: "Activity3", pricePerPerson: 15.0, imageName: "Image"),
        Activity(name: "Activity4", pricePerPerson: 55.0, imageName: "Image"),
        Activity(name: "Activity5", pricePerPerson: 50.0, imageName: "Image")
    ]
    
    func getActivities() -> [Activity] {
        return activities
    }
}

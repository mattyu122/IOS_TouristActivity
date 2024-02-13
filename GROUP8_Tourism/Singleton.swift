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
        Activity(name: "Activity1", pricePerPerson: 25.0, imageName: "Image", description: "happy activity", starRating: 4, hostName: "Peter", photo:["Image","Image"], contact: "555-333-1234"),
        Activity(name: "Activity2", pricePerPerson: 20.0, imageName: "Image", description: "happy activity", starRating: 3, hostName: "Kelly", photo:["Image","Image"], contact: "555-333-1234"),
        Activity(name: "Activity3", pricePerPerson: 15.0, imageName: "Image", description: "happy activity", starRating: 5, hostName: "John", photo:["Image","Image"], contact: "555-333-1234"),
        Activity(name: "Activity4", pricePerPerson: 55.0, imageName: "Image", description: "happy activity", starRating: 2, hostName: "David", photo:["Image","Image"], contact: "555-333-1234"),
        Activity(name: "Activity5", pricePerPerson: 50.0, imageName: "Image", description: "happy activity", starRating: 1, hostName: "Kate", photo:["Image","Image"], contact: "555-333-1234")
    ]
    
    func getActivities() -> [Activity] {
        return activities
    }
}

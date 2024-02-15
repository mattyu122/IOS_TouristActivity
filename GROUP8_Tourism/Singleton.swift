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
        Activity(name: "Niagara City Cruises", pricePerPerson: 33.5, imageName: "Image1", description: "Embark on one of Niagara Falls’ most iconic experiences and sail into the heart of the falls on this thrilling boat tour. You'll sail past the American Falls, Bridal Veil Falls and into the mist of the mighty Horseshoe Falls.", starRating: 4, hostName: "Peter", photo:["Image1","Image1.1"], contact: "555-333-1234"),
        Activity(name: "Niagara Falls Zipline", pricePerPerson: 69.99, imageName: "Image2", description: "WildPlay’s Zipline to the Falls is a hands-free, worry-free and fully-guided experience for both the thrill seekers and the hesitant. Enjoy the thrill of adventure and a stunning bird’s eye view of Niagara Falls in this once in a lifetime opportunity for guests over the age of seven.", starRating: 3, hostName: "Kelly", photo:["Image2","Image2.1"], contact: "555-333-1234"),
        Activity(name: "Whirlpool Aero Car", pricePerPerson: 19.0, imageName: "Image3", description: "Hop on the historic Whirlpool Aero Car for an unforgettable ride over the vibrant, teal-coloured waters of the Niagara River. Witness spectacular views of the swirling Niagara Whirlpool and the river’s Class 6 rapids as you soar 3,500 feet across the Niagara Gorge.", starRating: 5, hostName: "John", photo:["Image3","Image3.1"], contact: "555-333-1234"),
        Activity(name: "Butterfly Conservatory", pricePerPerson: 20.0, imageName: "Image4", description: "Step inside one of the largest glass-enclosed butterfly conservatories in North America and discover a tropical garden oasis. The Niagara Parks Butterfly Conservatory features over 2,000 vibrantly coloured butterflies fluttering freely throughout winding pathways adorned with lush vegetation and trickling waterfalls. Your self-guided walking tour begins with a short, informative video presentation.", starRating: 2, hostName: "David", photo:["Image4","Image4.1"], contact: "555-333-1234"),
        Activity(name: "Niagara's Fury", pricePerPerson: 17.5, imageName: "Image5", description: "Step inside our 4D motion theater and discover the ancient story of Niagara Falls in this multi-sensory simulation of the last Ice Age. The temperature will drop, mist and snow will fall and you’ll be surrounded by stunning visuals along the mighty Niagara River. Hang on tight, the trembling floor will make you feel the power of Mother Nature!", starRating: 1, hostName: "Kate", photo:["Image5","Image5.1"], contact: "555-333-1234")
    ]
    
    func getActivities() -> [Activity] {
        return activities
    }
}

//
//  User.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import Foundation


class User: CustomStringConvertible, ObservableObject {
    @Published  var email: String
    @Published  var password: String
    @Published  var firstName: String
    @Published  var lastName: String
    @Published  var contactNumber: Int
    @Published  var favoriteActivities: [Activity]
//    var fullName: String
    
    
    var description: String {
        return "First Name: \(firstName) \nLast Name: \(lastName) \nContact Number: \(contactNumber) \nEmail: \(email) \nPassword: \(password)"
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(email: String, password: String, firstName: String, lastName: String, contactNumber: Int, favoriteActivities: [Activity]) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.contactNumber = contactNumber
        self.favoriteActivities = favoriteActivities
//        self.fullName = firstName + lastName
    }
    
    init() {
        self.email = "NA"
        self.password = "NA"
        self.firstName = "NA"
        self.lastName = "NA"
        self.contactNumber = 0
        favoriteActivities = []
//        self.fullName = firstName + lastName
    }
    
}

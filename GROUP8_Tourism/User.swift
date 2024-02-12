//
//  User.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import Foundation


class User: CustomStringConvertible, ObservableObject {
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var contactNumber: Int
//    var fullName: String
    
    
    var description: String {
        return "First Name: \(firstName) \nLast Name: \(lastName) \nContact Number: \(contactNumber) \nEmail: \(email) \nPassword: \(password)"
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(email: String, password: String, firstName: String, lastName: String, contactNumber: Int) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.contactNumber = contactNumber
//        self.fullName = firstName + lastName
    }
    
    init() {
        self.email = "NA"
        self.password = "NA"
        self.firstName = "NA"
        self.lastName = "NA"
        self.contactNumber = 0
//        self.fullName = firstName + lastName
    }
    
}

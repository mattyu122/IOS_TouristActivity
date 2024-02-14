//
//  ProfileScreen.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject var userData: User
    
    @State private var firstNameFromUI: String = ""
    @State private var lastNameFromUI: String = ""
    @State private var contactNumberFromUI: Int = 0
    var body: some View {
        VStack{
            HStack {
                if userData.email == "123" {
                    Image("malePhoto")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                } else {
                    Image("femalePhoto")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                }
                VStack{
                    Text("First Name: \(userData.firstName)")
                    Text("Last Name: \(userData.lastName)")
                    Text("Username: \(userData.email)")
                    Text("Contact Number: \(String(userData.contactNumber))")
                }
            }
            
            VStack {
                Form {
                    TextField("FirstName: ", text: $firstNameFromUI)
                    TextField("LastName: ", text: $lastNameFromUI)
                }
                Button {
                    userData.firstName = firstNameFromUI
                } label: {
                    Text("Update")
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 150.0, height: 50.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.128, green: 0.262, blue: 0.337)/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

#Preview {
    ProfileScreen()
}

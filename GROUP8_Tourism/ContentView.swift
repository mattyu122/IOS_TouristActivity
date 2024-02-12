//
//  ContentView.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct ContentView: View {
    
    //UI variables
    @State private var userNameFromUI: String = ""
    @State private var passwordFromUI: String = ""
    @State private var rememberMe = false
    
    
    //Users Instances
    let users: [User] = [
        User(email: "123", password: "123", firstName: "John", lastName: "Doe", contactNumber: 6474334343),
        User(email: "321", password: "321", firstName: "Jane", lastName: "Doe", contactNumber: 4164844342)
    ]
    
    //Helper Variables
    @State private var selectedLink: Int? = 0
    @State private var isLoggedIn = false
    private var loggedInUser: User = User()
    
    
    //Alert Variables
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var resultMessage: String = ""
    @State var alertConfirmation: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                //Navigation Link Views
                NavigationLink(destination: HomeScreen().environmentObject(self.loggedInUser), tag: 1, selection: $selectedLink){}
                
                
                
                Spacer()
                
                Image("travellogo")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200.0, height: 200.0)
                
                //Title
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                //----------------------
                
                //Username Field
                TextField("Email Address", text: $userNameFromUI)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0, height: 50.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 1.0, brightness: 0.001, opacity: 0.159)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .keyboardType(.emailAddress)
                //                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
                //----------------------
                
                //Password Field
                SecureField("Password", text: $passwordFromUI)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0, height: 50.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 1.0, brightness: 0.001, opacity: 0.159)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .keyboardType(.default)
                    .cornerRadius(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                //----------------------
                
                //Remember Me Toggle
                Toggle("Remember Me", isOn: $rememberMe)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0, height: 50.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                    .toggleStyle(SwitchToggleStyle(tint: .red))
                
                //----------------------
                
                //Login Button
                Button {
                    authenticateUser(email: userNameFromUI, password: passwordFromUI)

                    print("\(userNameFromUI) \(passwordFromUI) \(rememberMe)")
                } label: {
                    Text("Login")
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 150.0, height: 50.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.128, green: 0.262, blue: 0.337)/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                .alert(isPresented: $showAlert){
                    Alert(title: Text("\(alertTitle)"),
                          message: Text("\(resultMessage)"),
                          dismissButton: .default(Text("\(alertConfirmation)")){})
                }
                //----------------------
                
                Spacer()
                
            }
            .padding()
            //            .background(Color.black)
            .navigationBarHidden(true)
            //            .navigationTitle(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/)
            //            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.261, saturation: 0.234, brightness: 0.951)/*@END_MENU_TOKEN@*/)
            
        }
        .padding()
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.128, green: 0.262, blue: 0.337)/*@END_MENU_TOKEN@*/)
        //        .ignoresSafeArea()
    }
    
    
    
    
    //Authenticate User Function validation
    func authenticateUser (email: String, password: String ) {
        
        if email.isEmpty || password.isEmpty {
            alertTitle = "INVALID CREDENTIALS"
            resultMessage = "Cannot be empty"
            alertConfirmation = "DISMISS"
            showAlert = true
            return
        }
        
        for user in users {
            if user.email == email && user.password == password {
                
                //If valid, user will be assigned to loggedInUser variable to pass on to next views
                loggedInUser.email = user.email
                loggedInUser.password = user.password
                loggedInUser.firstName = user.firstName
                loggedInUser.lastName = user.lastName
                loggedInUser.contactNumber = user.contactNumber
                
                
                isLoggedIn = true
                selectedLink = 1 //Go to HomeScreen
            
                return
                
            }
        
        }

        //Invalid user
        print("Incorrect Credentials")

        alertTitle = "INVALID CREDENTIALS"
        resultMessage = "Please try again"
        alertConfirmation = "DISMISS"
        showAlert = true
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct ContentView: View {
    
    //UI variables
    @State private var rememberMe = false
    @State private var userNameFromUI: String = ""
    @State private var passwordFromUI: String = ""
    @State private var isLoggedIn = false
    
    
    let userDefaults = UserDefaults.standard
    //Users Instances
    let users: [User] = [
        User(email: "123", password: "123", firstName: "John", lastName: "Doe", contactNumber: 6474334343, favoriteActivities: []),
        User(email: "321", password: "321", firstName: "Jane", lastName: "Doe", contactNumber: 4164844342, favoriteActivities: [])
    ]
    //Helper Variables
    @State private var selectedLink: Int? = 0
    @EnvironmentObject var loggedInUser: User
    
    
    //Alert Variables
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var resultMessage: String = ""
    @State var alertConfirmation: String = ""
    
    
    var body: some View {
        
        
        NavigationStack {
            
            //Navigation Link Views
            NavigationLink(destination: HomeScreen(), tag: 1, selection: $selectedLink){}
            
            VStack {
                
                Spacer()
                
                Image("travellogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 0)
                    )
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
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
                .padding()
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
            .navigationBarHidden(true)
            .background(Color.white)
            .onAppear{
                checkLoginStatus()
                
                
                //Remember me conditional
                if UserDefaults.standard.bool(forKey: "REMEMBER_ME") {
                    userNameFromUI = UserDefaults.standard.string(forKey: "USERNAME_KEY")!
                    passwordFromUI = UserDefaults.standard.string(forKey: "PASSWORD_KEY")!
                }
                
                
                //isLoggedIn conditional
                if userDefaults.bool(forKey: "ISLOGGEDIN_KEY") {
                    authenticateUser(email: "\(userDefaults.string(forKey: "USERNAME_KEY") ?? "")", password: "\(userDefaults.string(forKey: "PASSWORD_KEY") ?? "")")
                }
            }
            
        }
        .padding()
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
                
                
                if rememberMe {
                    UserDefaults.standard.set(rememberMe, forKey: "REMEMBER_ME")
                    UserDefaults.standard.set(email, forKey: "REMEMBER_USERNAME_KEY")
                    UserDefaults.standard.set(password, forKey: "REMEMBER_PASSWORD_KEY")
                } else {
                    UserDefaults.standard.set(rememberMe, forKey: "REMEMBER_ME")
                    UserDefaults.standard.removeObject(forKey: "REMEMBER_USERNAME_KEY")
                    UserDefaults.standard.removeObject(forKey: "REMEMBER_PASSWORD_KEY")
                }
                
                UserDefaults.standard.set(email, forKey: "USERNAME_KEY")
                UserDefaults.standard.set(password, forKey: "PASSWORD_KEY")
                
                isLoggedIn = true
                UserDefaults.standard.setValue(isLoggedIn, forKey: "ISLOGGEDIN_KEY")
                
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
    
    func checkLoginStatus(){
        let isLoggedIn = userDefaults.bool(forKey: AppSetting.IsLoggedIn.rawValue)
        if isLoggedIn{
            selectedLink = 1
        }
    }
}

#Preview {
    ContentView()
}

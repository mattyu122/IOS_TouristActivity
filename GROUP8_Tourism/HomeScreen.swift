//
//  HomeScreen.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct HomeScreen: View {
    
    //User Logged In
    @EnvironmentObject var userData: User
    
    
    //Helper Variables
    @State private var selectedLink: Int? = 0
    
    var body: some View {
        
        NavigationLink(destination: ContentView(), tag: 1, selection: $selectedLink){}
        
        VStack {
            
            TabView {
                
                ActivitiesScreen()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Browse Activities")
                    }
                
                
                FavouritesScreen()
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favourites")
                    }
                
                ProfileScreen()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                
            }
            
        }
        .navigationTitle(Text("Welcome, \(userData.fullName)"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Menu {
                    Button{
                        logout()
                    } label: {
                        Text("Logout")
                        
                    }
                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    
    //Logout function
    func logout(){
        
        UserDefaults.standard.removeObject(forKey: "ISLOGGEDIN_KEY")
        
        
        selectedLink = 1
        UserDefaults.standard.removeObject(forKey: AppSetting.USERNAME_KEY.rawValue)
        UserDefaults.standard.removeObject(forKey: AppSetting.PASSWORD_KEY.rawValue)
    }
}

#Preview {
    HomeScreen()
}

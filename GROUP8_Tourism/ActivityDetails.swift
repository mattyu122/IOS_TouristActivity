//
//  ActivityDetails.swift
//  GROUP8_Tourism
//
//  Created by Julia Prats on 2024-02-12.
//

import Foundation
import SwiftUI

struct ActivityDetails: View {
    let activity: Activity
    @EnvironmentObject var user: User
    @State private var isFavorite: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                Text(activity.name)
                    .font(.title)
                    .padding()
                
                Text("Price: $\(activity.pricePerPerson, specifier: "%.2f")/person")
                    .font(.headline)
                
                
                HStack{
                    ForEach(activity.photo, id:\.self){
                        photoName in
                        Image(photoName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, 2)
                    }
                }
                
                Text(activity.description)
                    .padding(.bottom, 2)
                
                HStack{
                    ForEach(0..<5) { star in
                        Image(systemName: star < activity.starRating ? "star.fill" : "star")
                            .foregroundColor(star < activity.starRating ? .yellow : .gray)
                    }
                }.padding(.bottom, 2)
                
                Text("Host by: \(activity.hostName)")
                    .font(.subheadline)
                    .padding(.bottom, 2)
                
                Button(action: {
                    let telephone = "tel://"
                    let formattedNumber = activity.contact
                    guard let url = URL(string: telephone + formattedNumber) else { return }
                    
                    UIApplication.shared.open(url)

                }) {
                    Text(activity.contact)
                        .foregroundColor(.blue)
                        .underline()
                }.padding(.bottom, 2)
                
                HStack{
                    ShareLink(item: "Name: \(activity.name) Price: \(activity.pricePerPerson)"){
                        HStack{
                            Image(systemName:"square.and.arrow.up")
                            Text("Share")
                        }
                    }
                    Button(action:{
                        isFavorite.toggle()
                        favoriteActivity(isFavorite: isFavorite)
//                        if !isFavorite {
//                            // Remove from favorites
//                            user.favoriteActivities.removeAll { $0 == activity }
//                        } else {
//                            // Add to favorites
//                            user.favoriteActivities.append(activity)
//                        }
                    }){
                        Label("Favorite", systemImage: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red: .gray)
                    }
                }
                
                
//                Image(activity.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
                
                
                Spacer()
            }
            .navigationTitle(activity.name)
            
            .onAppear(){
                isFavorite = user.favoriteActivities.contains(activity)
                print(user.favoriteActivities)
            }
        }
    }
    
    private func favoriteActivity(isFavorite: Bool) {
        let currentActivity = UserDefaults.standard.data(forKey: user.fullName) ?? Data()
        var realCurrentActivity = (try? JSONDecoder().decode([Activity].self, from:currentActivity)) ?? []
        if(isFavorite){
            user.favoriteActivities.append(activity)
            realCurrentActivity.append(activity)

        }else{
            user.favoriteActivities.removeAll { $0 == activity }
            realCurrentActivity.removeAll { $0 == activity}
        }
        
        if let updatedCurrentActivity = try? JSONEncoder().encode(realCurrentActivity){
            UserDefaults.standard.set(updatedCurrentActivity, forKey: user.fullName)
        }
    }
    
}

struct ActivityDetails_Previews: PreviewProvider {
    static var previews: some View {
        let sampleActivity = Activity(name: "Activity 1", pricePerPerson: 25.0, imageName: "Image", description: "happy activity", starRating: 4, hostName: "Peter", photo:["Image","Image"], contact: "555-333-1234")
        return ActivityDetails(activity: sampleActivity)
    }
}

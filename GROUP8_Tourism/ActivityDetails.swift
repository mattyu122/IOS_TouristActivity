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
                    let formattedNumber = activity.contact.replacingOccurrences(of: "-", with: "")
                    guard let url = URL(string: telephone + formattedNumber) else { return }
                    
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    } else {
                        // Handle the error or present an alert to the user
                        print("Unable to open the URL")
                    }
                }) {
                    Text(activity.contact)
                        .foregroundColor(.blue)
                        .underline()
                }.padding(.bottom, 2)
                
                HStack{
                    Button(action:{
                        shareActivity(activity: activity)
                    }){
                        Label("Share", systemImage: "square.and.arrow.up")
                    }.padding(.trailing, 20)
                    
                    Button(action:{
                        isFavorite.toggle()
                        if !isFavorite {
                            // Remove from favorites
                            user.favoriteActivities.removeAll { $0 == activity }
                        } else {
                            // Add to favorites
                            user.favoriteActivities.append(activity)
                        }
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
    
    private func shareActivity(activity: Activity){
        
    }
}

struct ActivityDetails_Previews: PreviewProvider {
    static var previews: some View {
        let sampleActivity = Activity(name: "Activity 1", pricePerPerson: 25.0, imageName: "Image", description: "happy activity", starRating: 4, hostName: "Peter", photo:["Image","Image"], contact: "555-333-1234")
        return ActivityDetails(activity: sampleActivity)
    }
}

//
//  ActivitiesScreen.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

import SwiftUI

struct ActivitiesScreen: View {
    @State private var searchText = ""
    let activities = Singleton.shared.getActivities()
    
    var filteredActivities: [Activity] {
        if searchText.isEmpty {
            return activities
        } else {
            return activities.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Things To Do in Niagara")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                List(filteredActivities) { activity in
                    NavigationLink(destination: ActivityDetails(activity: activity)) {
                        ActivityRow(activity: activity)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesScreen()
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(.systemGray2))
                        .padding(8)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}

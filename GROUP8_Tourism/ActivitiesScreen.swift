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
            return activities.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                List(filteredActivities) { activity in
                    NavigationLink(destination: ActivityDetails(activity: activity)) {
                        ActivityRow(activity: activity)
                    }
                }
            }
            .navigationTitle("Things To Do in City")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}

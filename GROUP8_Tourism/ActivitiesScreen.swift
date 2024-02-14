//
//  ActivitiesScreen.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct ActivitiesScreen: View {
    let activities = Singleton.shared.getActivities()
    
    var body: some View {
        NavigationView {
            VStack {
                
                List(activities) { activity in
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

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
                Text("Things To Do in City")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                List(activities) { activity in
                    NavigationLink(destination: ActivityDetails(activity: activity)) {
                        ActivityRow(activity: activity)
                    }
                }
            }
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

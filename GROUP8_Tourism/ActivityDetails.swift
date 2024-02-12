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
    
    var body: some View {
        VStack {
            Text(activity.name)
                .font(.title)
                .padding()
            
            Text("Price: $\(activity.pricePerPerson, specifier: "%.2f")/person")
                .font(.headline)
            
            Image(activity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            
            Spacer()
        }
        .navigationTitle(activity.name)
    }
}

struct ActivityDetails_Previews: PreviewProvider {
    static var previews: some View {
        let sampleActivity = Activity(name: "Activity 1", pricePerPerson: 25.0, imageName: "Image")
        return ActivityDetails(activity: sampleActivity)
    }
}

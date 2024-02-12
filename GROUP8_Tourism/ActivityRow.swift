//
//  ActivityRow.swift
//  GROUP8_Tourism
//
//  Created by Julia Prats on 2024-02-12.
//

import Foundation
import SwiftUI

struct ActivityRow: View {
    let activity: Activity
    
    var body: some View {
        HStack {
            Image(activity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(activity.name)
                    .font(.headline)
                Text("$\(activity.pricePerPerson, specifier: "%.2f") / person")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

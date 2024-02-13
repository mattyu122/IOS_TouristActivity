//
//  GROUP8_TourismApp.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

@main
struct GROUP8_TourismApp: App {
    var user = User()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(user)
        }
    }
}

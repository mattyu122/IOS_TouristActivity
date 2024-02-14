//
//  FavouritesScreen.swift
//  GROUP8_Tourism
//
//  Created by Leo Cesar Alcordo on 2024-02-11.
//

import SwiftUI

struct FavouritesScreen: View {
    @EnvironmentObject var user : User
    @State var showAlert = false
    var body: some View {
        NavigationView {
            VStack {
                
                if !user.favoriteActivities.isEmpty{
                    List{
                        ForEach(user.favoriteActivities, id:\.id){ activity in
                            NavigationLink(destination: ActivityDetails(activity:activity)){
                                ActivityRow(activity: activity)
                            }
                        }.onDelete(perform: { indexSet in
                            user.favoriteActivities.remove(atOffsets: indexSet)
                        })
                    }
                }else{
                    Text("List is empty")
                }
            }
            .padding()
            .navigationTitle("Favorites")
            .toolbar{
                Button{
                    showAlert = true
                }label: {
                    Text("Delete all")
                }
            }
            
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("You sure to delete all?"),
                      primaryButton: .cancel(),
                      secondaryButton: .destructive(Text("Delete all")){
                    deleteAll()
                }
                )
            })
        }
    }
    
    private func deleteAll(){
        user.favoriteActivities.removeAll()
    }
}

#Preview {
    FavouritesScreen()
}

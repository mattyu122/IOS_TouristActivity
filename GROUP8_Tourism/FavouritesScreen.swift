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
    @State var favoriteActivityList: [Activity] = []
    var body: some View {
        NavigationView {
            VStack {
                
                if !favoriteActivityList.isEmpty{
                    List{
                        ForEach(favoriteActivityList, id:\.id){ activity in
                            NavigationLink(destination: ActivityDetails(activity:activity)){
                                ActivityRow(activity: activity)
                            }
                        }.onDelete(perform: { indexSet in
                            favoriteActivityList.remove(atOffsets: indexSet)
                            saveFavoriteActivityList(list: &favoriteActivityList)

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
        
        .onAppear{
            let currentActivityList = UserDefaults.standard.data(forKey: user.fullName) ?? Data()
            favoriteActivityList = (try? JSONDecoder().decode([Activity].self, from: currentActivityList)) ?? []
            
        }
    }
    
    private func deleteAll(){
        favoriteActivityList.removeAll()
        saveFavoriteActivityList(list: &favoriteActivityList)
    }
    
    private func saveFavoriteActivityList(list: inout [Activity]){
        if let updatedFavoriteActivityList = try? JSONEncoder().encode(list){
            UserDefaults.standard.set(updatedFavoriteActivityList, forKey: user.fullName)
        }
    }
}

#Preview {
    FavouritesScreen()
}

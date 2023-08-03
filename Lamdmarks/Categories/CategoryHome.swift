//
//  CategoryHome.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/08/01.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView{
            List {
                userData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(userData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: userData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}

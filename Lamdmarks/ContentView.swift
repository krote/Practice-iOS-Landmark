//
//  ContentView.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    // tabに関する列挙型を定義
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tag(Tab.featured)
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
            LandmarkList()
                .tag(Tab.list)
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}

//
//  LandmarkList.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/25.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            List(landmarkData){
                landmark in NavigationLink(destination: LandmarkDetail(landmark: landmark)) {LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

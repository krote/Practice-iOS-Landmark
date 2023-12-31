//
//  UserData.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/25.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var hikes = hikeData
    @Published var features = featuresData
    @Published var categories = categoriesData
    @Published var profile = Profile.default
}


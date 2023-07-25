//
//  Landmark.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/25.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    enum Category: String, CaseIterable, Hashable, Codable{
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

struct Coordinates: Hashable, Codable{
    var latitude: Double
    var longitude: Double
}

extension Landmark {
    var image: Image{
        ImageStore.shared.image(name: imageName)
    }
}

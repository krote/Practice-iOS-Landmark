//
//  Hike.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/28.
//

import SwiftUI

struct Hike: Codable, Hashable, Identifiable {
    var name: String
    var id: Int
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    static var formatter = LengthFormatter()
    
    var ditanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    struct Observation: Codable, Hashable{
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var hearRate: Range<Double>
    }
}


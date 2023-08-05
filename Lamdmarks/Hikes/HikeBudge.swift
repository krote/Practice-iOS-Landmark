//
//  HikeBudge.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/08/05.
//

import SwiftUI

struct HikeBudge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center){
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

struct HikeBudge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBudge(name: "Preview Testing")
    }
}

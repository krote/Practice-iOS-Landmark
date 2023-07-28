//
//  RotateBadgeSymbol.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/27.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotateBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotateBadgeSymbol(angle: .init(degrees: 5))
    }
}

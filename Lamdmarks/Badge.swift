//
//  Badge.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/26.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        Path {
            path in
            
            path.move(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x: 200, y: 200))
            
            path.move(to: CGPoint(x: 300, y: 100))
            path.addLine(to: CGPoint(x: 250, y: 200))
            
            path.addQuadCurve(
                to: CGPoint(x: 200, y: 200),
                control: CGPoint(x: 230, y: 230)
            )
        }.stroke()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

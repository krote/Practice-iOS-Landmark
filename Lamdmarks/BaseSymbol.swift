//
//  BaseSymbol.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/26.
//

import SwiftUI

struct BaseSymbol: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.03
                let middle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
            }
        }
    }
}

struct BaseSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BaseSymbol()
    }
}

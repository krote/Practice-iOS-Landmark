//
//  HexagonParameters.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/26.
//

import SwiftUI

struct HexagonParameters: View {
    struct Segment {
        let useWidth: (CGFloat, CGFloat, CGFloat)
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let useHeight: (CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let points = [
        // 1
        Segment(
            useWidth: (1.00, 1.00, 1.00),
            xFactors: (0.60, 0.40, 0.50),
            useHeight: (1.00, 1.00, 0.00),
            yFactors: (0.05, 0.05, 0.00)
        ),
        //2
        Segment(
            useWidth: (1.00, 1.00, 0.00),
            xFactors: (0.05, 0.00, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors: (0.20 + adjustment, 0.30 + adjustment, 0.25 + adjustment)
        ),
        // 3
        Segment(
            useWidth: (1.00, 1.00, 0.00),
            xFactors: (0.00, 0.05, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors: (0.70 - adjustment, 0.80 - adjustment, 0.75 - adjustment)
        ),
        // 4
        Segment(
            useWidth: (1.00, 1.00, 1.00),
            xFactors: (0.40, 0.60, 0.50),
            useHeight: (1.00, 1.00, 1.00),
            yFactors: (0.95, 0.95, 1.00)
        ),
        // 5
        Segment(
            useWidth: (1.00, 1.00, 1.00),
            xFactors: (0.95, 1.00, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors: (0.80 - adjustment, 0.70 - adjustment, 0.75 - adjustment)
        ),
        // 6
        Segment(
            useWidth: (1.00, 1.00, 1.00),
            xFactors: (1.00, 0.95, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors: (0.30 + adjustment, 0.20 + adjustment, 0.25 + adjustment)
        )
    ]
    var body: some View {
        GeometryReader{ geometory in
            Path{
                path in
                var width: CGFloat = min(geometory.size.width, geometory.size.height)
                let height = width
                
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    ))
                
                HexagonParameters.points.forEach{
                    path.addLine(
                        to: .init(x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                                  y: height * $0.useHeight.0 * $0.yFactors.0)
                    )
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2)
                    )
                }
            }.fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0.0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
            .aspectRatio(contentMode: .fit)
        }
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct HexagonParameters_Previews: PreviewProvider {
    static var previews: some View {
        HexagonParameters()
    }
}

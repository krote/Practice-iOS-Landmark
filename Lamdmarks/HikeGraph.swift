//
//  HikeGraph.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/29.
//

import SwiftUI



//範囲オブジェクトの大きさを返す
func magnitude(of range: Range<Double>)  -> Double{
    return range.upperBound - range.lowerBound
}

struct HikeGraph: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HikeGraph_Previews: PreviewProvider {
    static var previews: some View {
        HikeGraph()
    }
}

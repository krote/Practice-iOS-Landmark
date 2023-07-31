//
//  HikeView.swift
//  Lamdmarks
//
//  Created by icdadmin on 2023/07/31.
//

import SwiftUI

extension AnyTransition{
    static var moveAndFade: AnyTransition{
        AnyTransition.move(edge: .trailing)
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation{
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90:0))
                        .scaleEffect(showDetail ? 1.5:1)
                        .padding()
                        .animation(.easeInOut)
                }
            }
            if showDetail{
                HikeDetail(hike: self.hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HikeView(hike: hikeData[0])
                .padding()
            Spacer()
        }
    }
}

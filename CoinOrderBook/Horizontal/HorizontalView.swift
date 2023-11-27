//
//  HorizontalView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel()
    
    var body: some View {
        ScrollView {
            Text("\(viewModel.value)")
            GeometryReader { proxy in
                
                let graphWidth = proxy.size.width
                
                VStack {
                    ForEach(horizontalDummy, id: \.id) { item in
                        HStack {
                            Text(item.data)
                                .frame(width: graphWidth * 0.2)
                            ZStack() {
                                Rectangle()
                                    .foregroundStyle(.yellow.opacity(0.5))
                                    .frame(width: CGFloat(item.point) / 10)
                                    .frame(maxWidth: graphWidth * 0.7)
                                Text(item.point.formatted())
                            }
                            .frame(maxWidth: .infinity)
                            .background(.orange.opacity(0.3))
                        }
                        .frame(height: 40)
                    }
                }
                .background(.gray)
                .onTapGesture {
                    print(proxy)
                    print(proxy.size)
                    viewModel.timer()
                }
            }
        }
    }
}

#Preview {
    HorizontalView()
}

//
//  HorizontalView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market: Market(market: "krw-btc", korean: "비트코인", english: "Bitcoin"))
    
    var body: some View {
        ScrollView {
            Text(viewModel.market.korean)
            GeometryReader { proxy in
                
                let graphWidth = proxy.size.width * 0.7 //차트 최대 너비
                
                VStack {
                    ForEach(viewModel.askOrderBook, id: \.id) { item in
                        HStack {
                            Text(item.price.formatted())
                                .frame(width: proxy.size.width * 0.25)
                            ZStack(alignment: .leading) {
                                
                                let graphSize = item.size / viewModel.largestAskSize() * graphWidth
                                
                                Rectangle()
                                    .foregroundStyle(.yellow.opacity(0.5))
                                    .frame(maxWidth: graphSize, alignment: .leading)
                                Text(item.size.formatted())
                                    .frame(width: graphWidth)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.orange.opacity(0.3))
                        }
                        .frame(height: 40)
                    }
                }
                .background(.blue.opacity(0.4))
            }
        }
        .onAppear {
//            viewModel.timer()
            viewModel.fetchOrderBook()
        }
    }
}

#Preview {
    HorizontalView()
}

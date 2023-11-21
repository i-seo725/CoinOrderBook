//
//  ListView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/21/23.
//

import SwiftUI

struct ListView: View {
    
    //ObserveredObject(데이터 초기화) vs StateObject(데이터 유지)
    //ObserveredObject: 상위뷰의 데이터가 변경되어 데이터를 새로 그릴 때 하위뷰의 데이터도 다시 그림(인스턴스 다시 생성, 갈아낌)
    //StateObject를 사용하면 상위뷰가 렌더링되어도 기존에 있던 인스턴스가 유지됨
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        LazyVStack {
            Button("Call") {
                viewModel.fetchAllMarket()
            }
            ForEach(viewModel.market, id: \.self) { item in //hashable 때문에 데이터 하나만 뜸
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.korean)
                            .fontWeight(.bold)
                        Text(item.english)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text(item.market)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
            }
        }
        .onAppear {
            print("=========================나타남")
//            viewModel.fetchAllMarket()
        }
    }
}

#Preview {
    ListView()
}

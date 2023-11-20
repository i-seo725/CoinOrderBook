//
//  ContentView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var banner = "3,456,321,753원"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    LazyVStack {
                        ForEach(1..<50) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .refreshable { //iOS15 이상
                banner = "\(Int.random(in: 100000...999999999).formatted())원"
            }
            .navigationTitle("My Wallet")
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.brown)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                Text(banner)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    func listView(data: Int) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("비트코인 \(data)")
                Text("Bitcoin \(data)")
            }
            Spacer()
            Text("KRW-BTC")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}

//
//  WidgetTabView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/30/23.
//

import SwiftUI

struct WidgetTabView: View {
    
    @State private var selectedTab = "house"
    
    var body: some View {
        //selection : 선택되는 디폴트탭 설정
        TabView(selection: $selectedTab) {
            Button("1111", action: {
                selectedTab = "star"
            })
                .tabItem { Image(systemName: "heart") }
                .tag("heart")
            Text("2")
                .tabItem { Image(systemName: "house") }
                .tag("house")
            Text("3")
                .tabItem { Image(systemName: "star") }
                .tag("star")
        }
        .onOpenURL(perform: {
            switch $0.absoluteString {
            case "heart": selectedTab = "heart"
            case "star": selectedTab = "star"
            default: selectedTab = "house"
            }
        })
    }
}

#Preview {
    WidgetTabView()
}

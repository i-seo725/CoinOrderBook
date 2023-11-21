//
//  OverlayView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/21/23.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            ZStack { // 안에 있는 뷰 들의 크기 제각각
                Circle()
                    .fill(.yellow)
                .frame(width: 150, height: 150)
                Text("안녕하세여 반갑습니다 안녕히가세여")
            }
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
                .overlay { // 서브뷰 같이 circle의 크기를 벗어나지 않게 됨
                    Text("안녕하세여 반갑습니다 안녕히가세여")
                }
        }
    }
}

#Preview {
    OverlayView()
}

//
//  WalletView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/22/23.
//

import SwiftUI

struct WalletView: View {
    
    @State private var isExpandable = false
    @State private var showDetail = false
    let wallet = walletList
    @State private var currentWallet = WalletModel(name: "", index: 0) //사용자가 탭한 카드 정보
    @Namespace var animation
    
    var body: some View {
        VStack {
            topTitile()
            cardSpace()
            Button("Animation On") {
                withAnimation(.bouncy) {
                    isExpandable = true
                }
            }
            Button("Animation OFF") {
                withAnimation(.bouncy) {
                    isExpandable = false
                }
            }
        }
        .overlay {
            if showDetail {
                WalletDetailView(showDetail: $showDetail, currentWallet: currentWallet, animation: animation)
            }
        }
    }
    
    func cardSpace() -> some View {
        ScrollView {
            ForEach(wallet, id:\.self) { item in
                cardView(item)
            }
        }
        .overlay {
            Rectangle()
                .fill(.blue.opacity(isExpandable ? 0 : 0.01))
                .onTapGesture {
                    withAnimation {
                        isExpandable = true
                    }
                }
        }
    }
    
    func cardView(_ data: WalletModel) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(data.color)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .offset(y: CGFloat(data.index) * (isExpandable ? 0 : -130))
            .onTapGesture {
                withAnimation(.bouncy) {
                    currentWallet = data
                    showDetail = true
                }
            }
            .matchedGeometryEffect(id: data, in: animation)
    }
    
    
    func topTitile() -> some View {
        Text("Eunseo Wallet!")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding()
    }
    
    
    func topOverlayButton() -> some View {
        Button {
            withAnimation(.bouncy) {
                isExpandable = false
            }
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(Color.white)
                .padding(8)
                .background(.black, in: Circle())
        }
        .rotationEffect(.degrees(isExpandable ? 225 : 45))
        .opacity(isExpandable ? 1 : 0)
    }
    
}

#Preview {
    WalletView()
}

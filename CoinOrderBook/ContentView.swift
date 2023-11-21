//
//  ContentView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    
    //@ObservedObject: Published의 신호를 받는 프로퍼티 래퍼
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var renderingTestNumber = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("테스트: \(renderingTestNumber)")
                NavigationLink("배너 테스트", value: renderingTestNumber)
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(1..<5) { data in
                                bannerView()
                                    .containerRelativeFrame(.horizontal) // iOS17+
                                    .onTapGesture {
                                        viewModel.fetchBanner()
                                    }
                            }
                        }
                        .scrollTargetLayout() //스크롤하고자 하는 대상에 대한 레이아웃 설정
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    //viewAligned : view 중앙에 맞춰줌
                    //paging : 프레임에 맞춰서 넘겨주기만 함, 한쪽으로 쏠릴 수 있음
//                    .safeAreaPadding([.horizontal], 40) //safeArea를 안쪽으로 들어오게 패딩 줘서 스크롤해서 넘길 다음 뷰가 살짝 보임
                    
                    ListView()
                }
            }
            .scrollIndicators(.automatic)
            .refreshable { //iOS15 이상
                viewModel.fetchBanner()
                renderingTestNumber = Int.random(in: 1...100)
            }
            .navigationTitle("My Wallet")
            .navigationDestination(for: Int.self) { _ in
                BannerTestView(testNumber: $renderingTestNumber)
            }
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(viewModel.banner.color)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.4))
                        .offset(x: -100, y: 10)
                        .scaleEffect(1.5, anchor: .leading)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title2)
                Text(viewModel.banner.totalFormat)
                    .font(.title)
                    .bold()
            }
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOffset(geometryProxy))
//            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
    
    //geometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0 //x축 제일 앞에서 멈추겠다
        return -result  //사각형 크기에 들어가게 하려고 음수로 전환
    }
    
}

#Preview {
    ContentView()
}

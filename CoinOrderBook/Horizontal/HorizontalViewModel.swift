//
//  HorizontalViewModel.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import SwiftUI

class HorizontalViewModel: ObservableObject {
    
    @Published var value = 0.0
    @Published var dummy: [HorizontalData] = []
    
    @Published var askOrderBook: [OrderBookItem] = []
    @Published var bidOrderBook: [OrderBookItem] = []
    
    let market: Market
    
    init(market: Market) {
        self.market = market
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 50, repeats: true) { timer in
            self.value += 5
            self.fetchDummyData()
            self.fetchOrderBook()
            //타이머가 동작할 때마다 데이터 달라지게 구성
        }
    }
    
    func fetchDummyData() {
        dummy = [
            HorizontalData(data: "은서"),
            HorizontalData(data: "토마토"),
            HorizontalData(data: "파스타"),
            HorizontalData(data: "노란색"),
            HorizontalData(data: "우유"),
            HorizontalData(data: "홍학"),
            HorizontalData(data: "참새"),
            HorizontalData(data: "감기"),
            HorizontalData(data: "함박눈")
        ]
    }
    
    func largest() -> Int {
        let data = dummy.sorted(by: { $0.point > $1.point })
        return data.first!.point
    }
    
    func largestAskSize() -> Double {
        return askOrderBook.sorted(by: { $0.size > $1.size }).first!.size
    }
    
    func largestBidSize() -> Double {
        return bidOrderBook.sorted(by: { $0.size > $1.size }).first!.size
    }
    
    func fetchOrderBook() {
    
        let url = URL(string: "https://api.upbit.com/v1/orderbook?markets=\(market.market)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([OrderBookModel].self, from: data)   //응답값이 배열로 옴!
                
                DispatchQueue.main.async {
                    
                    let result = decodedData.first?.orderbook_units ?? [OrderBookUnit(ask_price: 0, bid_price: 0, ask_size: 0, bid_size: 0)] //[0]으로 가져오면 런타임 오류 날 수도 있음
                    let ask = result.map { OrderBookItem(price: $0.ask_price, size: $0.ask_size) }.sorted(by: { $0.price > $1.price })
                    let bid = result.map { OrderBookItem(price: $0.bid_price, size: $0.bid_size) }.sorted(by: { $0.price > $1.price })
                    
                    self.askOrderBook = ask
                    self.bidOrderBook = bid
                    
                    print(ask, "@@@\n", bid)
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
}

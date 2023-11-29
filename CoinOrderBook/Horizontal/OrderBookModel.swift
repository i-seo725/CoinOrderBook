//
//  OrderBookModel.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/28/23.
//

import Foundation

struct OrderBookModel: Decodable {
    let market: String
    let timestamp: Int
    let total_ask_size, total_bid_size: Double
    let orderbook_units: [OrderBookUnit]
}

struct OrderBookUnit: Decodable {
    let ask_price, bid_price: Double
    let ask_size, bid_size: Double
}

//위 구조체는 서버에서 오는 값
//아래는 뷰에서 사용하기 위해 가공하는 모델

struct OrderBookItem: Hashable, Identifiable {
    let id = UUID()
    let price: Double
    let size: Double
}

//
//  HorizontalData.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import Foundation

struct HorizontalData: Identifiable {
    
    let id = UUID()
    let data: String
    let point: Int = Int.random(in: 100...3000)
    
}

let horizontalDummy = [
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

func largest() -> Int {
    let data = horizontalDummy.sorted(by: { $0.point > $1.point })
    return data.first!.point
}

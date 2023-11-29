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
    let point: Int = Int.random(in: 100...5000)
    
}

//
//  WalletModel.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/22/23.
//

import Foundation
import SwiftUI

struct WalletModel: Hashable {
    let color = Color.random()
    let name: String
    let index: Int
}

var walletList = [
    WalletModel(name: "Hue Card", index: 0),
    WalletModel(name: "Jack Card", index: 1),
    WalletModel(name: "Bran Card", index: 2),
    WalletModel(name: "Koko Card", index: 3)
]

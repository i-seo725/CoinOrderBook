//
//  UserDefaultsGroup.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/30/23.
//

import Foundation

extension UserDefaults {
    
    static var groupShared: UserDefaults {
        let appGroupID = "group.eunseo.MyWallet"
        return UserDefaults(suiteName: appGroupID)!
    }
    
}

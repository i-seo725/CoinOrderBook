//
//  ListViewModel.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/21/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var market = [Market(market: "dmstj", korean: "은서", english: "eunseo"), Market(market: "dmstj", korean: "이은서", english: "eunseo")]

    func fetchAllMarket() {
    
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)   //응답값이 배열로 옴!
                self.market = decodedData
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
}

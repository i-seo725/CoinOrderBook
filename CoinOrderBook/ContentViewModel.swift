//
//  ContentViewModel.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/21/23.
//

import Foundation

class ContentViewModel: ObservableObject {  //ObservableObject: 관찰자, 달라지는 내용을 관찰해서 published가 업데이트하게 함
    
    //@state 대신 @published, 데이터가 바뀔 때마다 뷰 업데이트
    @Published var banner = Banner()
    @Published var money: [Market] = []
    
    func fetchBanner() {
        banner = Banner()
    }

    
    func fetchAllMarket() {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)   //응답값이 배열로 옴!
                self.money = decodedData
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
}

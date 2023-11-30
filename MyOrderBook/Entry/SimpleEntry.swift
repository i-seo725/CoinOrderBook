//
//  SimpleEntry.swift
//  MyOrderBookExtension
//
//  Created by 이은서 on 11/30/23.
//

import WidgetKit

struct SimpleEntry: TimelineEntry { //위젯을 구성하는데 필요한 데이터
    let date: Date      //프로토콜 채택하면 필수로 사용해야함, 어느 시점에 렌더링할지 관리
    let test: String
    let token: String
    let price: Int
    
    //relevance: 스마트 스택 우선순위 관리, 프로토콜에 옵셔널로 존재
}

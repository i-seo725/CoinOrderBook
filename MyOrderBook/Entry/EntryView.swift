//
//  EntryView.swift
//  MyOrderBookExtension
//
//  Created by 이은서 on 11/30/23.
//

import SwiftUI  // view를 보여줘야 해서 import 필요
import WidgetKit

struct MyOrderBookEntryView : View { //위젯을 구성하는 뷰
    var entry: Provider.Entry

    var body: some View {
        VStack {     //스크롤 안 돼서 리스트 못씀
            Text(entry.test)
            Text(entry.date, style: .time)
//            Text(entry.token)
            Text(UserDefaults.groupShared.string(forKey: "Market") ?? "콩나물")
            Text(entry.price.formatted())
        }
    }
}

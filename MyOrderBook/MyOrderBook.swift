//
//  MyOrderBook.swift
//  MyOrderBook
//
//  Created by 이은서 on 11/29/23.
//

import WidgetKit
import SwiftUI

struct MyOrderBook: Widget {
    let kind: String = "MyOrderBook"    //위젯의 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyOrderBookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget) //잠금화면의 컬러감 맞춰주는 느낌
            } else {
                MyOrderBookEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")  //위젯 선택할 때 이름
        .description("This is an example widget.")  //위젯 선택할 때 내용
        .supportedFamilies([.accessoryCircular, .accessoryInline, .accessoryRectangular])
    }
}

//#Preview(as: .systemSmall) {
//    MyOrderBook()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}

//
//  MyOrderBook.swift
//  MyOrderBook
//
//  Created by 이은서 on 11/29/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    //실제 값을 가져오기까지 시간이 걸릴 때 보임
    //위젯킷이 최초로 렌더링할 때 사용, 렌더링 되기까지는 스켈레톤 뷰가 나옴
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    //위젯 선택하는 미리보기 화면에서 보여지는 내용
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😇")
        completion(entry)
    }

    //위젯 상태 변경 시점(시간 마다, 몇 분마다 위젯 업데이트)
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "🤩")
            entries.append(entry)
        }

        //타임라인 마지막 날짜가 지난 뒤 위젯킷이 새로운 타임라인을 요청할 수 있도록 설정(.atEnd)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry { //위젯을 구성하는데 필요한 데이터
    let date: Date
    let emoji: String
}

struct MyOrderBookEntryView : View { //위젯을 구성하는 뷰
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("시간:")
            Text(entry.date, style: .time)

            Text("이모티콘:")
            Text(entry.emoji)
        }
    }
}

struct MyOrderBook: Widget {
    let kind: String = "MyOrderBook"    //위젯의 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyOrderBookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget) //컬러감 잠금화면 맞춰주는 느낌
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

#Preview(as: .systemSmall) {
    MyOrderBook()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

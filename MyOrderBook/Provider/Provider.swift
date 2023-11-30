//
//  Provider.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/30/23.
//

import WidgetKit

struct Provider: TimelineProvider {
    //실제 값을 가져오기까지 시간이 걸릴 때 보임
    //위젯킷이 최초로 렌더링할 때 사용, 렌더링 되기까지는 스켈레톤 뷰가 나옴
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), test: "test", token: "토큰", price: 1000)
    }

    //위젯 선택하는 미리보기 화면에서 보여지는 내용
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), test: "은서", token: "bitcoin", price: 50000)
        completion(entry)
    }

    //위젯 상태 변경 시점(시간 마다, 몇 분마다 위젯 업데이트)
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: Date(), test: "eunseo", token: "BITCOIN", price: Int.random(in: 100...99999))
            entries.append(entry)
        }

        //타임라인 마지막 날짜가 지난 뒤 위젯킷이 새로운 타임라인을 요청할 수 있도록 설정(.atEnd)
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

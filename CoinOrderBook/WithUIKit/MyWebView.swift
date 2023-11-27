//
//  WebView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//
//
//SwiftUI 프로젝트에 UIKit 객체 활용하는 방법: UIViewRepresentable 프로토콜 채택하기
//associatedtype : 메서드 불러와서 UIViewType에 사용할 타입 작성하면 typealias 안써도 됨
import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
}

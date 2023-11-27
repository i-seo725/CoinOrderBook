//
//  SeSACView.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import SwiftUI

struct SeSACView: View {
    
    @State private var textFieldText = "SwiftUI"
    @State private var uiKitTextFieldText = "UIKit"
    
    var body: some View {
        VStack {
            Text(textFieldText)
            TextField("SwiftUI 텍스트 필드", text: $textFieldText) //하위뷰
            VStack {
                Text(uiKitTextFieldText)
                MyTextField(text: $uiKitTextFieldText)
            }
            .background(.gray)
            MyWebView(url: "https://www.apple.com")
                .frame(width: 300, height: 600)
        }
    }
}

#Preview {
    SeSACView()
}

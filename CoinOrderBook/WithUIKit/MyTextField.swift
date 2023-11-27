//
//  MyTextField.swift
//  CoinOrderBook
//
//  Created by 이은서 on 11/27/23.
//

import SwiftUI

//SwiftUI -> UIKit(인풋) @state/@bindind 사용하면 잘됨
//UIKit -> SwiftUI(아웃풋) Coordinator 클래스 사용
struct MyTextField: UIViewRepresentable {
    
    @Binding var text: String   //밖에서 데이터 받아서 표현하기 위해
    
    //인스턴스 생성, 사용하는 프로퍼티 여기서 작성 / UIKit으로 데이터 받기 위한 코드
    func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.borderStyle = .none
        view.keyboardType = .numberPad
        view.tintColor = .orange
        view.font = .boldSystemFont(ofSize: 17)
        view.textAlignment = .center
        view.text = text
        view.placeholder = "UIKit 활용 중입니다"
        view.clearButtonMode = .whileEditing
        view.delegate = context.coordinator //하단에 만든 Coordinator 클래스에 접근
        return view
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    //UIKit에 들어있는 기능을 SwiftUI로 꺼내줄 때 사용
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text   //_ : Binding으로 들어온 데이터를 String으로 바꿔주기 위해 사용
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            text = textField.text ?? ""
            return true
        }
        
    }
    
}

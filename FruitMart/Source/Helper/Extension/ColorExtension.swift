//
//  ColorExtension.swift
//  FruitMart
//
//  Created by sokol on 2021/03/20.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

extension Color {
    static let peach = Color("peach") //앱에서 사용할 메인색
    static let primaryShadow = Color.primary.opacity(0.2) //그림자에 사용할 색
    static let secondaryText = Color(hex: "#6e6e6e")
    static let backgroundColor = Color(.systemGray6)
    
    //#123456 또는 123456과 같이 헥스코드를 가진 문자열을 입력받아 #이 있다면 제거하고 나머지 문자열로부터 rgb 값을 추출해 Color타입 인스턴스를 생성
    init(hex: String) {
        let scanner = Scanner(string: hex) //문자열 파서 역할을 하는 클래스
        _ = scanner.scanString("#") //scanString은 iOS 13부터 지원. "#" 문자 제거
        
        var rgb: UInt64 = 0 //문자열을 Int64 타입으로 변환해 rgb 벼수에 저장. 반환할 수 없다면 0을 반환
        
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0 // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0 // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0 // 우측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
    }
}

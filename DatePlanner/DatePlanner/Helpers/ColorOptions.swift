//
//  ColorOptions.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

struct ColorOptions {
    // 색상 배열
    static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
    ]
    
    // 기본 색상값 지정
    static var `default` : Color = Color.primary

    // 색상값 랜덤 추출
    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        }
        else {
            return .primary
        }
    }
}

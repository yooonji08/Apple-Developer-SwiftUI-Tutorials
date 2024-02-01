//
//  Symbol.swift
//  SymbolGrid
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// Equatable: 구조체, 인스턴스를 비교하고 싶다면 꼭 사용해야 함
// ex. string, int는 == 연산 비교 가능
// -> but, 일반 구조체, 인스턴스는 == 연산으로 비교 불가능
// -> Equatable 프로토콜을 선언해준다면 == 연산 가능
// -> class는 Equatable 프로토콜, == 메서드 구현 두개 다 해줘야만 == 연산 가능
struct Symbol: Identifiable, Equatable {
    var id = UUID() // 고유 식별자
    var name: String // SF Symbol값
}

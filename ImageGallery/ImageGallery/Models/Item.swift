//
//  Item.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID() // 고유 식별자
    let url: URL // 파일 경로, 이미지를 비동기적으로 로드함
}

// Item내부의 값을 ==비교연산을 하기 위해서 만든 확장
extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}


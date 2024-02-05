//
//  Panda.swift
//  MemeCreator
//
//  Created by 이윤지 on 2/5/24.
//

import SwiftUI

// JSON 데이터를 파싱하기 위한 데이터 모델 객체
struct Panda: Codable {
    var description: String // 설명
    var imageUrl: URL? // 이미지 링크
    
    static let defaultPanda = Panda(description: "Lovely Panda",
                                    imageUrl: URL(string: "https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}

struct PandaCollection: Codable {
    var sample: [Panda]
}

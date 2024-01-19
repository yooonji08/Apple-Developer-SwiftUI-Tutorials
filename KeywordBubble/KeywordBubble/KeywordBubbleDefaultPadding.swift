//
//  KeywordBubbleDefaultPadding.swift
//  KeywordBubble
//
//  Created by 이윤지 on 1/19/24.
//

import SwiftUI

// 텍스트 chip 박스 만들기
// 추후 다른 뷰에서 재사용하기 위한 아이템 파일
struct KeywordBubbleDefaultPadding: View {
    // keyword, symbol의 값을 쉽게 바꾸기 위한 값
    let keyword: String
    let symbol: String
    
    var body: some View {
        // 이모지와 텍스트를 함께 정렬
        // systemImage는 SF Symbols에 있는 이모지 사용 => 이모지가 텍스트 형식으로 들어감
        Label(keyword, systemImage: symbol)
            .font(.title) // 이모지와 텍스트에 모두 적용됨
            .foregroundStyle(.white)
            .padding()
            // 박스의 스타일: Capsule(모서리가 둥근 직사각형), 투명한 보라색
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

struct KeywordBubbleDefaultPadding_Previews: PreviewProvider {
    let keywords = ["chives", "fern-leaf lavender"]
    var previews: some View {
        VStack {
            ForEach(keywords, id: \.self) { word in
                KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf")
            }
        }
    }
}

/*#Preview {
    KeywordBubbleDefaultPadding()
}*/
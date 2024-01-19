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
    // 텍스트의 크기에 비례하여 동적으로 크기를 조정(relativeTo에 title을 넣음으로써 텍스트 크기에 맞춰 동적으로 크기가 조정됨)
    @ScaledMetric(relativeTo: .title) var paddingWidth = 24
    
    var body: some View {
        // 이모지와 텍스트를 함께 정렬
        // systemImage는 SF Symbols에 있는 이모지 사용 => 이모지가 텍스트 형식으로 들어감
        Label(keyword, systemImage: symbol)
            .font(.title) // 이모지와 텍스트에 모두 적용됨
            .foregroundStyle(.white)
            // 박스의 크기가 커져도, 이모지와 텍스트가 박스와 약간의 여백이 있도록 알아서 조정해줌
            .padding(paddingWidth)
            // 박스의 스타일: Capsule(모서리가 둥근 직사각형), 투명한 보라색
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

// Preview 만들기
// static을 꼭 붙여야만 preview가 나타남
// PreviewProvider: 수동으로 preview 만들기
struct KeywordBubbleDefaultPadding_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack {
            ForEach(keywords, id: \.self) { word in
                // keywords 배열에 있는 텍스트 값을 불러와서 뷰에 적용함
                KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf")
            }
        }
    }
}

/*#Preview {
    KeywordBubbleDefaultPadding()
}*/

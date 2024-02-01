//
//  ContentView.swift
//  ColorGrid
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// 색상이 지정된 직사각형으로 그리드 보기 만들기
struct ContentView: View {
    // 3열 그리드 만들기 상수
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    @State private var selectedColor = Color.gray // 하나의 뷰에서 사용할 예정이며, 값이 변경될 수 있다면 @State 프로퍼티 꼭 붙이기
    
    // 색상 배열
    // 그리드를 그릴 때, 다음 색상 배열을 반복하여 나타낼 예정
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]
    
    var body: some View {
        // 수직 정렬
        VStack {
            // 사용자가 선택한 색상에 맞게 텍스트 색상 설정
            Text("Selected Color")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
                .padding(10)
            
            // 스크롤뷰
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    // 배열 반복
                    ForEach(allColors, id: \.description) { color in
                        Button {
                            self.selectedColor = color
                        } label: {
                            RoundedRectangle(cornerRadius: 4.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit)
                                .foregroundStyle(color)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding(10)
    }
}

#Preview {
    ContentView()
}

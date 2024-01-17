//
//  CategoryRow.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/16/24.
//

import SwiftUI

// 카테고리의 각 행에 대한 파일
struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        // 가로
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // 세로 스크롤뷰
            ScrollView(.horizontal, showsIndicators: false) {
                // 세로
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            // 아이템의 세부 정보 페이지로 이동
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            // 해당 아이템을 누르면
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4)) // 표시할 텍스트 길이 지정
    )
}

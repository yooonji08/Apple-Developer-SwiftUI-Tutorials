//
//  StarRating.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

// 별점
struct StarRating: View {
    @Binding var rating: Int // 별점 등급, 다른 뷰에서 값을 변경했을 때 동기화되도록 함
    private let maxRating = 5 // 가장 높은 등급
    
    
    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { value in
                Image(systemName: "star")
                // 정수 값이 입력 값보다 작거나 같을 때, fill 별을 표시
                // 정수 값이 입력 값보다 클 때, none 별을 표시
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundStyle(.blue)
                    // 사용자의 제스처에 맞게 별 이미지가 상호작용 하도록
                    .onTapGesture {
                        if value != rating {
                            rating = value
                        }
                        else {
                            rating = 0
                        }
                    }
            }
        }
    }
}

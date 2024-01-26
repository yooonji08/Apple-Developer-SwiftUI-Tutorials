//
//  RegularTitleView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

// 레시피 세부 정보 페이지 중 페이지 상단 제목 부분에 표시되는 뷰
struct RegularTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.largeTitle)
            StarRating(rating: $recipe.rating)
        }
        Spacer()
        Text(recipe.subtitle)
            .font(.subheadline)
    }
}

//
//  CompactTitleView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct CompactTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Spacer()
        VStack {
            Text(recipe.title)
                .font(.title2)
            StarRating(rating: $recipe.rating)
            Text(recipe.subtitle)
                .font(.subheadline)
        }
        Spacer()
    }
}

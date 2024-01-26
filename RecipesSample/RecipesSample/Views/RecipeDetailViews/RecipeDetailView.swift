//
//  RecipeDetailView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack {
            TopView(recipe: $recipe)
            ScrollView {
                BottomView(recipe: recipe)
            }
        }
    }
}

private struct TopView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Binding var recipe: Recipe
    
    private var frameHeight: CGFloat {
        verticalSizeClass == .compact ? 150.0 : 300.0
    }
    
    var body: some View {
        TitleView(recipe: $recipe)
            .frame(height: frameHeight, alignment: .bottom)
            .background(alignment: .bottom) {
                recipe.fullImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .clipped()
    }
}

private struct BottomView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            RecipeIngredientsView(recipe: recipe)
            RecipeDirectionsView(recipe: recipe)
        }
        .padding()
    }
}

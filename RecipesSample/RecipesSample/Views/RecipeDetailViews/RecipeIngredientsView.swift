//
//  SwiftUIView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct RecipeIngredientsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Text("INGREDIENTS")
                .underline()
                .padding(.bottom)
            Text(recipe.ingredients)
                .font(.caption)
                .lineSpacing(10)
        }
        .padding()
        .background(Color.secondary.colorInvert())
    }
}

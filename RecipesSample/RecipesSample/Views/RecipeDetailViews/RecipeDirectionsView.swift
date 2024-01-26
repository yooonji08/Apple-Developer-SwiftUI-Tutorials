//
//  RecipeDirectionsView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct RecipeDirectionsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Directions")
                .font(.title3)
                .padding(.bottom)
            Text(recipe.directions)
        }
    }
}

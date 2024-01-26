//
//  TitleView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct TitleView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Binding var recipe: Recipe
    
    var body: some View {
        HStack {
            switch horizontalSizeClass {
            case .compact:
                CompactTitleView(recipe: $recipe)
            default:
                RegularTitleView(recipe: $recipe)
            }
        }
        .padding()
        .background(Color.primary
            .colorInvert()
            .opacity(0.75))
    }
}

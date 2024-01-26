//
//  RecipeDetailToolbar.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct RecipeDetailToolbar: ToolbarContent {
    @Binding var recipe: Recipe
    @Binding var showDeleteConfirmation: Bool
    let deleteRecipe: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: toolbarItemPlacement) {
            Toggle(isOn: $recipe.isFavorite) {
                Image(systemName: "heart")
                    .symbolVariant(recipe.isFavorite ? .fill : .none)
            }
            .toggleStyle(.button)
        }
        
        ToolbarItem(placement: toolbarItemPlacement) {
            Button(role: .destructive) {
                showDeleteConfirmation = true
            } label: {
                Image(systemName: "trash")
            }
            .alert("Delete Recipe?", isPresented: $showDeleteConfirmation) {
                Button(role: .destructive) {
                    withAnimation {
                        deleteRecipe()
                    }
                } label: {
                    Text("Delete \(recipe.title)")
                }
            }
        }
    }
    
    private var toolbarItemPlacement: ToolbarItemPlacement {
        .topBarTrailing
    }
}

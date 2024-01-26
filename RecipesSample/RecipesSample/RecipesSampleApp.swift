//
//  RecipesSampleApp.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

@main
struct RecipesSampleApp: App {
    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    @State private var selectedSidebarItem: SidebarItem? = SidebarItem.all
    @State private var selectedRecipeId: Recipe.ID?
    
    var body: some Scene {
        WindowGroup {
        }
    }
}
//
//  DetailView.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var recipeId: Recipe.ID?
    @EnvironmentObject private var recipeBox: RecipeBox
    @State private var showDeleteConfirmation = false
    
    private var recipe: Binding<Recipe> {
        // binding된 값 읽기-쓰기
        Binding {
            // get 클로저 - 기존 레시피 정보를 검색할 때 사용
            // 레시피가 존재하지 않는 다면, empty 반환
            if let id = recipeId {
                return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
            }
            else {
                return Recipe.emptyRecipe()
            }
        // set 클로저 - 새로운 레시피 값을 업데이트
        } set: { updatedRecipe in
            recipeBox.update(updatedRecipe)
        }
    }
    var body: some View {
        ZStack {
            if recipeBox.contains(recipeId) {
                // 세부 정보 페이지에서 레시피 정보를 읽고 쓸 수 있도록 함
                RecipeDetailView(recipe: recipe)
                    .navigationTitle(recipe.wrappedValue.title)
                    .navigationBarTitleDisplayMode(.inline)
            }
            else {
                RecipeNotSelectedView()
            }
        }
    }
    
    private func deleteRecipe() {
        recipeBox.delete(recipe.id)
    }
}

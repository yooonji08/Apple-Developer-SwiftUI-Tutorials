//
//  ContentListView.swift8888
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

// 레시피 목록 화면
struct ContentListView: View {
    @Binding var selection: Recipe.ID?
    let selectedSidebarItem: SidebarItem
    @EnvironmentObject private var recipeBox: RecipeBox
    @State private var recipeEditorConfig = RecipeEditorConfig()
    
    var body: some View {
        RecipeListView(selection: $selection, selectedSidebarItem: selectedSidebarItem)
            .navigationTitle(selectedSidebarItem.title)
            .toolbar {
                ToolbarItem {
                    // 레시피 추가 버튼
                    Button {
                        // 버튼을 클릭하면, mutating 메소드를 호출
                        recipeEditorConfig.presentAddRecipe(sidebarItem: selectedSidebarItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                    // 화면을 꽉 채우지 않는 바텀 시트
                    // 위아래 스크롤을 통해 이전 뷰로 이동 가능
                    // dismiss: 현재 화면을 dismiss하여 이전 화면으로 돌아가기 위하여 사용
                    // ex. Button { dismiss() }
                    .sheet(isPresented: $recipeEditorConfig.isPresented, onDismiss: didDismissEditor) {
                        RecipeEditor(config: $recipeEditorConfig)
                    }
                }
            }
    }
    
    // 레시피 변경사항을 저장하는 메서드
    private func didDismissEditor() {
        if recipeEditorConfig.shouldSaveChanges {
            if recipeEditorConfig.recipe.isNew {
                selection = recipeBox.add(recipeEditorConfig.recipe)
            }
            else {
                recipeBox.update(recipeEditorConfig.recipe)
            }
        }
    }
}

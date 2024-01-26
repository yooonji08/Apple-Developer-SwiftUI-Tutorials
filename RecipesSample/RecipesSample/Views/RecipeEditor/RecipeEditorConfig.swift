//
//  RecipeEditorConfig.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct RecipeEditorConfig {
    // 뷰에서 필요한 데이터들
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPresented = false

    // 뷰에서 상태가 변경되면, 이를 파악하고 새로운 상태를 업데이트하는 함수
    // 일반 함수에서는 값 변경 불가능. 그러나 mutating을 사용하면, 함수 내부에서 값 변경 가능
    // 사용자가 레시피 추가 버튼을 클릭할 때, 해당 함수가 호출됨
    mutating func presentAddRecipe(sidebarItem: SidebarItem) {
        recipe = Recipe.emptyRecipe() // 새로운 인스턴스 생성(새로운 레시피 생성)
        
        // 선택한 항목을 기반으로 레시피 속성 적용
        switch sidebarItem {
        case .favorites:
            recipe.isFavorite = true
        case .collection(let name):
            recipe.collections = [name]
        default:
            break
        }
        
        // 사용자가 레시피 저장 버튼을 누르지 않았음으로 해당 값은 false로 설정
        // ???: 애초에 변수를 선언할 때 default값으로 false를 주었는데, 굳이 여기서 false로 설정하는 이유는..?
        shouldSaveChanges = false
        // 편집기 보기를 표시하는 플래그(?)
        isPresented = true
    }
    
    // 기존 레시피를 편집할 때 호출되는 함수
    // _(와일드 카드): 언더바를 사용하면 다음 함수 호출 시, 파라미터 작성 생략 가능
    // ex. presentEditRecipe(recipeToEdit: "값~~") -> presentEditRecipe("값~~")
    mutating func presentEditRecipe(_ recipeToEdit: Recipe) {
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
    // 기존 레시피 정보 변경을 완료한 경우 호출
    // 변경사항을 저장
    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    // 기존 레시피 정보 변경을 취소한 경우 호출
    // 변경사항 저장x
    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}

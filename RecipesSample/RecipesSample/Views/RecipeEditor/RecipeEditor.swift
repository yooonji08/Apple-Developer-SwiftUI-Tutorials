//
//  RecipeEditor.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/26/24.
//

import SwiftUI

struct RecipeEditor: View {
    // Binding: 뷰에 필요한 데이터에 대한 양방향 읽기-쓰기 바인딩 제공
    // 자식 뷰에서 값이 변경되면, 부모 뷰에도 값이 변경됨
    // <-> State: 자식 뷰 값이 변경되어도, 부모 뷰 값은 안 바뀜
    @Binding var config: RecipeEditorConfig
    
    var body: some View {
        NavigationStack {
            // 레시피를 편집할 때 입력하는 필드
            RecipeEditorForm(config: $config)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(editorTitle)
                    }
                    
                    // 취소 버튼 클릭 시 cancel 메소드에 의해 로직 처리
                    ToolbarItem(placement: cancelButtonPlacement) {
                        Button {
                            config.cancel()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    
                    // 저장 버튼 클릭 시, done 메소드에 의해 로직 처리
                    ToolbarItem(placement: saveButtonPlacement) {
                        Button {
                            config.done()
                        } label: {
                            Text("Save")
                        }
                    }
                }
                .padding()
        }
    }
    
    // 편집 상태 여부에 따른 툴바 이름 설정
    private var editorTitle: String {
        config.recipe.isNew ? "Add Recipe" : "Edit Recipe"
    }

    // 취소 버튼 클릭
    private var cancelButtonPlacement: ToolbarItemPlacement {
        .navigationBarLeading
    }
    
    private var saveButtonPlacement: ToolbarItemPlacement {
        .topBarTrailing
    }
}

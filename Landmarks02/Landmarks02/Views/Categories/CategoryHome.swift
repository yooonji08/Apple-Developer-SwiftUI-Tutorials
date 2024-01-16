//
//  CategoryHome.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/16/24.
//

import SwiftUI

// 카테고리별로 랜드마크 목록을 정렬하고 리스트를 보여주기
struct CategoryHome: View {
    // self는 자기 자신(ModelData)을 가리키는 프로퍼티. ex. 안드로이드의 this
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

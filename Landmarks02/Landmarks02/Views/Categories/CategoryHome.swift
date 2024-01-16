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
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    // 상단의 Featured에 있는 이미지가 뷰의 가장자리에 맞게 둥근 모서리가 적용되고, 뷰의 크기만큼 확대됨
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    // 카테고리의 각 행에 들어갈 목록 추가하기
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // Lakes, Mountains에 있는 목록이 뷰에 꽉 차도록 만듦
                .listRowInsets(EdgeInsets())
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

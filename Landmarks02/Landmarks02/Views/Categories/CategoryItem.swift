//
//  CategoryItem.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/16/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                // original: 기존 이미지 색상
                // template: 시스템 컬러(파랑)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                // renderingmode가 template이라면? foregroundStyle로 색상 지정 가능
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}

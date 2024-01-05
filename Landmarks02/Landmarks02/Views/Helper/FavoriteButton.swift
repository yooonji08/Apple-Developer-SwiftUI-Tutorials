//
//  FavoriteButton.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/5/24.
//

import SwiftUI

struct FavoriteButton: View {
    // 버튼의 현재 상태를 나타내는 바인딩 isSet변수값
    // 읽고 쓰기 가능
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                // icon만 표시되도록, text는 표시X
                .labelStyle(.iconOnly)
                // 값이 true이면 yellow 아니면 gray
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}

//
//  AddingPlaceholder.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct AddingPlaceholder: View {
    var body: some View {
        Text("Spacing with a Placeholder")
        HStack {
            TrainCar(.rear)
            // 다음 뷰의 투명도를 0으로 만들어서 화면 상에서 안 보이도록 만듦
            // -> 아이템 사이의 여백을 만들 수 있음
            TrainCar(.middle)
                .opacity(0)
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    AddingPlaceholder()
}

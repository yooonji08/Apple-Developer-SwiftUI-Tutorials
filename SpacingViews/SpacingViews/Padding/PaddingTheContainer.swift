//
//  PaddingTheContainer.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct PaddingTheContainer: View {
    var body: some View {
        Text("Padding the Container")
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        // 기차 뷰와 트랙 사이에 여백 추가
        .padding()
        .background(Color(.blue))
        TrainTrack()
    }
}

#Preview {
    PaddingTheContainer()
}

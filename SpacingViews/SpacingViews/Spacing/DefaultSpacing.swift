//
//  DefaultSpacing.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct DefaultSpacing: View {
    var body: some View {
        Text("Default Spacing")
        // MARK: HStack 안에 있는 뷰들은 약간의 간격을 둔 채로 배치 된다
        HStack {
            TrainCar(.rear) // 기차 끝
            TrainCar(.middle) // 기차 중간
            TrainCar(.front) // 기차 앞
        }
        TrainTrack()
    }
}

#Preview {
    DefaultSpacing()
}

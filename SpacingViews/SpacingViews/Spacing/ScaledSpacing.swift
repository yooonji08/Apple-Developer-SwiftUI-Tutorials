//
//  ScaledSpacing.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct ScaledSpacing: View {
    // MARK: 디바이스의 크기에 따라서 열차의 크기가 변경되면, ScaledMetric 프로퍼티로 인해서 여백도 이에 맞게 자동으로 조정됨
    @ScaledMetric var trainCarSpace = 5
    
    var body: some View {
        Text("Scaled Spacing")
        HStack(spacing:trainCarSpace) {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    ScaledSpacing()
}

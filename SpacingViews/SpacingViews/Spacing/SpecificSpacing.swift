//
//  SpecificSpacing.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct SpecificSpacing: View {
    var body: some View {
        Text("Specific Spacing")
        // MARK: spacing을 사용하면 하위 뷰들이 default간격이 사용되는 대신, 지정한 값으로 뷰가 구성됨(spacing 0은 하위 뷰들의 사이 공간 없이, 딱 맞춰서 정렬됨)
        HStack(spacing: 0) {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    SpecificSpacing()
}

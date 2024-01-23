//
//  SpecificPadding.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct SpecificPadding: View {
    var body: some View {
        Text("Specific Padding")
        HStack {
            TrainCar(.rear)
            // 5만큼 padding 주기
            TrainCar(.middle)
                .padding(5)
                .background(Color(.blue))
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    SpecificPadding()
}

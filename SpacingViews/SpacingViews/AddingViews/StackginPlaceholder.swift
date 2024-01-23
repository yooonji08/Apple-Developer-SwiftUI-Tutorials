//
//  StackginPlaceholder.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct StackginPlaceholder: View {
    var body: some View {
        Text("Stacking with a Placeholder")
        HStack {
            TrainCar(.rear)
            // 뷰를 겹친 후, 겹친 뷰의 크기를 조정하고 투명도를 0으로 만들어서 여백 만들기
            ZStack {
                TrainCar(.middle)
                    .font(.largeTitle)
                    .opacity(0)
                TrainCar(.middle)
            }
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    StackginPlaceholder()
}

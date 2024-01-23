//
//  PaddingSomeEdges.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct PaddingSomeEdges: View {
    var body: some View {
        Text("Padding Some Edges")
        HStack {
            TrainCar(.rear)
            // .leading이랑 [.leading]은 같음
            // TrainCar(.middle)뷰의 앞쪽에 여백 추가
            TrainCar(.middle)
                .padding(.leading)
                .background(Color(.blue))
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    PaddingSomeEdges()
}

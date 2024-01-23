//
//  DefaultPadding.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct DefaultPadding: View {
    var body: some View {
        Text("Default Padding")
        HStack {
            TrainCar(.rear)
            // MARK: middle아이템에 padding을 주었기에 상하좌우 인접한 모든 뷰들에 대하여 여백이 들어감. 따라서 인접한 뷰들의 사이가 많이 띄워진 상태로 화면이 그려짐
            TrainCar(.middle)
                .padding()
                .background(Color(.blue))
            TrainCar(.front)
        }
        TrainTrack()
    }
}

#Preview {
    DefaultPadding()
}

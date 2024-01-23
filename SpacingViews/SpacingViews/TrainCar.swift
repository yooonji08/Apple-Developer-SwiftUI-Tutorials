//
//  TrainCar.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

// 기차 이모지
enum TrainSymbol: String {
    case front = "train.side.front.car" // 기차 앞
    case middle = "train.side.middle.car" // 기차 중간
    case rear = "train.side.rear.car" // 기차 끝
}

struct TrainCar: View {
    let position: TrainSymbol
    let showFrame: Bool
    
    // 상수에 값 넣기
    init(_ position: TrainSymbol, showFrame: Bool = true) {
        self.position = position
        self.showFrame = showFrame
    }
    
    var body: some View {
        // 이모지 넣기
        Image(systemName: position.rawValue)
            .background(Color(.gray))
    }
}

struct TrainTrack: View {
    var body: some View {
        Divider()
            .frame(maxWidth: 200)
    }
}

#Preview {
    TrainCar(.rear)
}

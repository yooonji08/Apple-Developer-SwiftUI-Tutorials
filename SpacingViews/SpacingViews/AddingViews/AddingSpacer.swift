//
//  AddingSpacer.swift
//  SpacingViews
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

struct AddingSpacer: View {
    var body: some View {
        Text("Spacer")
        // 기본적으로 좌우를 꽉 채워서 뷰가 만들어짐
        // -> TrainCar(.rear) 뷰와 TrainCar(.front)뷰가 좌우에 붙어있음
        // 만약, 화면 좌우에 여백을 주고 싶다면 아래 코드와 같이 따로 지정해야 함
        HStack {
            TrainCar(.rear)
                .padding(.leading, 16)
            Spacer()
            TrainCar(.middle)
            Spacer()
            TrainCar(.front)
                .padding(.trailing, 16)
        }
        TrainTrack()
    }
}

#Preview {
    AddingSpacer()
}

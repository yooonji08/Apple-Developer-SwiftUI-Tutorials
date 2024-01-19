//
//  IfElseTrain.swift
//  HidingViews
//
//  Created by 이윤지 on 1/19/24.
//

// SwiftUI Concepts Tutorials
// - Choosing the right way to hide a view
import SwiftUI

struct IfElseTrain: View {
    // 중간 열차 이모지를 숨길지에 대한 여부
    // 만약, 앱 전체에서 숨김 여부를 지정하고 싶다면 Binding 또는 Environment 값 사용하기
    var longerTrain: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                // longerTrain값이 true라면, 중간 열차 이모지 보여주기
                // else라면, 중간 열차 이모지 안 보여줌(gone 상태), 공간 차지x
                if longerTrain {
                    Image(systemName: "train.side.middle.car")
                }
                // 위의 코드와 똑같은 코드, opacity(투명도)를 조절하여 이미지 제어
                // 그러나, else일 경우 중간 열차 부분이 비워 있는 채로 뷰에 출력됨(invisible 상태)
                Image(systemName: "train.side.middle.car").opacity(longerTrain ? 1 : 0)
                Image(systemName: "train.side.front.car")
            }
            Divider()
        }
    }
}

#Preview {
    IfElseTrain()
}

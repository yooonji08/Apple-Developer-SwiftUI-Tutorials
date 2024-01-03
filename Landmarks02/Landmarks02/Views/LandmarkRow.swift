//
//  LandmarkRow.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark // Landmark class 객체 변수
    
    var body: some View {
        HStack {
            landmark.image
                .resizable() // 해상도에 맞게 이미지 크기를 조정
                .frame(width: 50, height: 50) // 너비 50, 높이 50
            Text(landmark.name)
                    
            Spacer() // 공백
        }
    }
}

// 미리보기에 이름을 지정하면 쉽게 구분 가능
/*#Preview("Turtle Rock") {
    LandmarkRow(landmark: landmarks[0]) // landmarkData 파일에 있는 첫번째 json의 값을 가져옴
}

#Preview("Salmon") {
    LandmarkRow(landmark: landmarks[1]) // landmarkData 파일에 있는 두번째 json값을 가져옴
}*/

// Group - 콘텐츠를 그룹화해주는 컨테이너
// 캔버스에 하나의 미리보기로 쌓인 그룹의 하위 뷰를 렌더링해줌
#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

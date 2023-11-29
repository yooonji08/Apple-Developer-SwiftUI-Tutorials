//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 이윤지 on 11/26/23.
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

#Preview {
    LandmarkRow(landmark: landmarks[0]) // landmarkData파일에 있는 첫번째 json의 값을 가져옴
}

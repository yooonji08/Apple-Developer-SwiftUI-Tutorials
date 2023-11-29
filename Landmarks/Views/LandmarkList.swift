//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이윤지 on 11/29/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // 세로 방향 리스트(정적 뷰)
        /*List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }*/
                
        // 세로 방향 리스트(동적 뷰) - Landmark에 Identifiable 프로토콜을 정의하지 않은 경우
        /*List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }*/
                
        // 세로 방향 리스트(동적 뷰) - Landmark에 Identifiable 프로토콜을 정의한 경우
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}

//
//  LandmarkList.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkList: View {
    // 별 표시한 랜드마크만 볼지 말지에 대한 여부를 지정하는 변수
    // 변수의 값을 true로 바꾸면, 별 표시가 되어 있는 랜드마크만 리스트로 띄워줌
    @State private var showFavoritesOnly = false
    
    // 속성과 값을 확인하여 랜드마크 목록의 필터링된 버전(별 표시가 있는 것)을 계산함
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // 세로 방향 리스트(정적 뷰)
        /*List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }*/
                
        // 세로 방향 리스트(동적 뷰) - Landmar    Identifiable 프로토콜을 정의하지 않은 경우
        /*List(landmarks, id: \.id) { landmark in
            LandmarkRow(landmark: landmark)
        }*/
        
        NavigationSplitView {
            // 세로 방향 리스트(동적 뷰) - Landmar    Identifiable 프로토콜을 정의한 경우
            List(filteredLandmarks) { landmark in
                NavigationLink { // 각 행을 링크로 연결
                    LandmarkDetail(landmark: landmark) // 각 행을 클릭하면 세부 화면으로 이동
                } label: { // 리스트에 들어갈 정보를 담음
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks") // 리스트의 상단에 title 지정
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

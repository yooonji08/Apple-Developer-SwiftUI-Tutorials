//
//  LandmarkList.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkList: View {
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
        
        //
        NavigationSplitView {
            // 세로 방향 리스트(동적 뷰) - Landmar    Identifiable 프로토콜을 정의한 경우
            List(landmarks) { landmark in
                NavigationLink { // 각 행을 링크로 연결
                    LandmarkDetail() // 각 행을 클릭하면 세부 화면으로 이동
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

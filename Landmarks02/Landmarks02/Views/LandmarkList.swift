//
//  LandmarkList.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: 전역 변수. modelData값이 바뀌면, 모든 뷰의 ui및 값이 바뀜
    @Environment(ModelData.self) var modelData
    
    // 별 표시한 랜드마크만 볼지 말지에 대한 여부를 지정하는 변수
    // 변수의 값을 true로 바꾸면, 별 표시가 되어 있는 랜드마크만 리스트로 띄워줌
    // MARK: 내부 파일에서 사용 가능함, false이면 뷰가 사라지고, true이면 뷰를 만듦.
    @State private var showFavoritesOnly = false
    
    // 속성과 값을 확인하여 랜드마크 목록의 필터링된 버전(별 표시가 있는 것)을 계산함
    // MARK: filter함수는 landmarks에 있는 값중 원하는 값만 가져올 때 사용함 isFavorite값이 true이거나 showFavoritesOnly값에 따라서(현재로서는 true) 데이터를 보여주고자 할 때 사용함
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
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
            List {
                // 토글 추가하기
                // showFavoritesOnly변수가 true이면 별표시된 랜드마크만 표시
                // showFavoritesOnly변수가 false이면 모든 랜드마크 표시
                // 변수를 직접사용하려면 {$변수명}처럼 사용하기 => binding형태로 사용 중
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // 리스트를 중첩으로 만들 때 사용하는 ForEach구문
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink { // 각 행을 링크로 연결
                        LandmarkDetail(landmark: landmark) // 각 행을 클릭하면 세부 화면으로 이동
                    } label: { // 리스트에 들어갈 정보를 담음
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // MARK: filteredLandmarks 변수 값이 변경되면(토글 on/off 여부에 따라서) 애니메이션 실행
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks") // 리스트의 상단에 title 지정
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}

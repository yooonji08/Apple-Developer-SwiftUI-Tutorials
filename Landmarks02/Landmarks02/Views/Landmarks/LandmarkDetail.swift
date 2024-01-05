//
//  LandmarkDetail.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // MARK: 전역 변수
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    // ???: landmark의 id값과 리스트에 있는 랜드마크의 position id값 비교
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    // ContentView에 있는 코드를 가져옴
    var body: some View {
        // Bindable wrapper를 사용하여 body내부에 프로퍼티 추가
        @Bindable var modelData = modelData
        
        // 화면 스크롤을 가능하게 해줌
        ScrollView {
            // MapView 불러오고, 높이 300
            // 높이 지정을 안하면, 화면 전체에 MapView를 띄움
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            // 원형 이미지의 높이가 -130, padding을 하단-130
            // 이미지를 위쪽으로 이동하여 텍스트를 위한 공간을 만듦
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                // 별 표시 버튼 추가하기
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                // VStack전체에 대하여 한번에 폰트, 색상을 설정
                // secondary는 gray색
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider() // 구분선
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        // 가장 상단의 툴바 이름을 각 랜드마크 이름으로 지정함
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(modelData)
}

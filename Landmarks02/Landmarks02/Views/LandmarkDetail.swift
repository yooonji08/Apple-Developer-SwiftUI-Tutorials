//
//  LandmarkDetail.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    // ContentView에 있는 코드를 가져옴
    var body: some View {
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
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.name)
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
    LandmarkDetail(landmark: ModelData().landmarks[0])
}

//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 이윤지 on 11/30/23.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        // ContentView에 있는 코드를 가져옴
        VStack {
            // MapView 불러오고, 높이 300
            // 높이 지정을 안하면, 화면 전체에 MapView를 띄움
            MapView()
                .frame(height: 300)
            
            // 원형 이미지의 높이가 -130, padding을 하단에 -130
            // 이미지를 위쪽으로 이동하여 텍스트를 위한 공간을 만듦
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                // VStack전체에 대하여 한번에 폰트, 색상을 설정
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider() // 구분선
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            // 전체 VStack콘텐츠를 화면 상단으로 올려주기 위한 스페이서
            Spacer()
        }
    }
}

#Preview {
    LandmarkDetail()
}

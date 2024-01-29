//
//  HomeView.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

// 홈 화면
struct HomeView: View {
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle) // 글씨 크기
                .fontWeight(.bold) // 글씨 두께
                .padding()
            
            // 프로필 이미지
            Image(information.image)
                .resizable() // 사진 크기 조절
                .aspectRatio(contentMode: .fit) // 공간에 맞게 이미지 크기 조정
                .background(Color.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 16)) // 둥근 모서리 네모
                .padding(40)
            
            // 이름
            Text(information.name)
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}

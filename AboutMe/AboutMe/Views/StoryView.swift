//
//  StoryView.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

// 내 소개
struct StoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
        // 뷰가 길어질 경우를 대비하여 스크롤 가능한 뷰 삽입
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
    }
}

#Preview {
    StoryView()
}

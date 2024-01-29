//
//  StoryPageView.swift
//  MyStory
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

// 각 페이지에 제공된 선택 메뉴를 탐색하기 위한 스토리 화면
struct StoryPageView: View {
    let story: Story // 스토리 정보 상수
    let pageIndex: Int // 페이지 인덱스
    
    var body: some View {
        VStack {
            ScrollView {
                //Text(story.pages[0].text)
                Text(story[pageIndex].text) // == story.pages[0].text와 같음
            }
            
            ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
                // 각 네비게이션을 누르면, StoryView에 있는 NavigationStack에 클릭한 뷰가 push되어 stack으로 저장됨
                NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination)) {
                    // 하단에 텍스트 띄우기 및 위치 조정
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StoryPageView(story: story, pageIndex: 0)
}

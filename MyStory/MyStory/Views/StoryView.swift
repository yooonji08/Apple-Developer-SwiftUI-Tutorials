//
//  StoryView.swift
//  MyStory
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        // NavigationStack:
        // -> 사용자가 화면 이동한 경로를 stack 쌓듯이 저장
        // -> 항상 NavigationLink와 navigationDestination수정자를 사용
        // -> root view는 제거되지 않음
        NavigationStack {
            StoryPageView(story: story, pageIndex: 0)
        }
    }
}

#Preview {
    StoryView()
}

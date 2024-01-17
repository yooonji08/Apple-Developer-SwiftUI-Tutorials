//
//  ContentView.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    // 탭 선택을 위한 상태 변수
    // list보기 or 카드뷰(featured) 보기
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // 하단에 네비게이션과 같이 tab이 띄워짐
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

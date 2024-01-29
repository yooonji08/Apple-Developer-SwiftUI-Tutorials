//
//  ContentView.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    // body에서 앱에 대한 사용자의 인터페이스 또는 UI를 만듦
    var body: some View {
        // 여러 하위 뷰를 전환할 때 사용 like bnv
        TabView {
            HomeView()
                .tabItem {
                    // Label, Text, Image만 허용
                    Label("Home", systemImage: "person")
                }
            
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

#Preview {
    ContentView()
}

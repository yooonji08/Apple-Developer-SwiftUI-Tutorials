//
//  MyScene.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

// Scene:
// -> 프로토콜, 앱의 생명 주기와 앱의 UI의 부분을 구성
// -> 사용자에게 보여주고 싶은 뷰 계층의 컨테이너 역할
// -> 하나의 윈도우에서 상태를 변경해도 다른 window에 영향을 주지 않음
// -> ex. ipadOS, macOS에서 주로 사용
struct MyScene: Scene {
    // body에도 Scene 적용(프로토콜 준수하기 위함)
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

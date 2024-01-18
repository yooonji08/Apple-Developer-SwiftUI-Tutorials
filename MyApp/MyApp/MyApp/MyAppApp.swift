//
//  MyAppApp.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI // swiftui 프레임워크를 선언함

@main // @main: 앱의 시작 화면을 정의하는 어노테이션
struct MyAppApp: App { // App: 앱의 구조와 동작을 나타내는 타입
    // body: 앱의 content를 표시해줌
    // Scene:
    // -> body에는 항상 해당 프로토콜을 사용, 가장 최상위 root뷰, lifecycler을 가짐
    // -> Scene에서만 WindowGroup, Settings 등을 사용
    var body: some Scene {
        // WindowGroup:
        // -> 앱이 표시하는 기본 창을 나타냄, 모든 뷰의 컨테이너 역할
        // -> 터치 이벤트 등의 이벤트를 가장 먼저 수신하여 자식 뷰에게 이벤트를 전달함
        WindowGroup {
            // ContentView:
            // -> 뷰들이 위치할 공간(= 컨테이너)을 나타냄
            // -> ContentView안에 뷰들을 구현
            ContentView()
        }
    }
}

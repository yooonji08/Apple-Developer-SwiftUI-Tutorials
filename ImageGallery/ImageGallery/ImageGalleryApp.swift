//
//  ImageGalleryApp.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// 이미지가 큰 경우, 이미지가 많은 경우 로드하는데 앱이 지연되는 것을 방지하기 위하여
// 비동기 요청을 사용하여 앱 그리기
@main
struct ImageGalleryApp: App {
    // StateObject: 스크린에 대하여 인스턴스화하고 유지해야하는
    // -> ObservableObject 클래스가 있을 때 사용
    // -> 데이터와의 양방향 바인딩 가능
    @StateObject var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                // 이미지 그리드로 보기 화면
                GridView()
            }
            .environmentObject(dataModel)
        }
    }
}

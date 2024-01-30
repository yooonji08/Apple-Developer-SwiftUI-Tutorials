//
//  DatePlannerApp.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

@main
struct DatePlannerApp: App {
    // StateObject: 화면을 다시 그려도, 항상 같은 결과를 얻을 수 있음
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            // 네비게이션의 가장 최상위 뷰
            NavigationStack {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            // 뷰 간 데이터 공유를 위함
            .environmentObject(eventData)
        }
    }
}

//
//  SymbolGridApp.swift
//  SymbolGrid
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

@main
struct SymbolGridApp: App {
    var body: some Scene {
        WindowGroup {
            // 네비게이션
            NavigationStack {
                SymbolGrid() // 최상위 부모 뷰
            }
        }
    }
}

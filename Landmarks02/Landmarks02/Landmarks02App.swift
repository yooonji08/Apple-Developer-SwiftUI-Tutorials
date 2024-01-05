//
//  Landmarks02App.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI

@main
struct Landmarks02App: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}

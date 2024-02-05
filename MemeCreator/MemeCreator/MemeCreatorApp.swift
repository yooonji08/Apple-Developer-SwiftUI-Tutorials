//
//  MemeCreatorApp.swift
//  MemeCreator
//
//  Created by 이윤지 on 2/5/24.
//

import SwiftUI

@main
struct MemeCreatorApp: App {
    @StateObject private var fetcher = PandaCollectionFetcher()
    
    var body: some Scene {
        WindowGroup {
            MemeCreator()
                .environmentObject(fetcher)
        }
    }
}

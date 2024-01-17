//
//  Profile.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/17/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var sesasonalPhoto = Season.winter
    var goalDate = Date()
    
    // MARK: defaults는 원래 예약어(swift에서 제공하는)임. 이를 프로퍼티로 사용하고자 ``를 사용함
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}

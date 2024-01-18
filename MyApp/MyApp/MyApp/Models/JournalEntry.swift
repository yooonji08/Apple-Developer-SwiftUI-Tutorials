//
//  JournalEntry.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct JournalEntry: Identifiable, Hashable {
    let id = UUID() // UUID: 고유 값, 36개의 문자열로 구성, 앱을 재실행해도 값이 유지됨
    let createdDate: Date
    var text = ""
    
    init(createdDate: Date, text: String = "") {
        self.createdDate = createdDate
        self.text = text
    }
}

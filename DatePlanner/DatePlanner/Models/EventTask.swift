//
//  EventTask.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

// 이벤트에 대한 할 일 항목
struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

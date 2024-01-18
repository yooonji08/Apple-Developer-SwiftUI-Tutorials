//
//  DateView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct DateView: View {
    let date: Date
    
    // 요일
    private var weekday: String {
        date.formatted(Date.FormatStyle()
            .weekday(.abbreviated)).localizedUppercase
    }
    
    // 날짜
    private var day: String {
        date.formatted(Date.FormatStyle()
            .day())
    }
    
    var body: some View {
        HStack {
            Text("\(weekday)")
                .font(.headline)
            Text("\(day)")
                .font(.headline)
        }
    }
}

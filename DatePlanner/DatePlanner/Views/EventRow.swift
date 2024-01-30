//
//  EventRow.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

// EventList화면에 있는 목록에 들어갈 각 행 화면
struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .sfSymbolStyling()
                .foregroundStyle(event.color)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)

                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
            
        }
        .badge(event.remainingTaskCount)
    }
}

#Preview {
    EventRow(event: Event.example)
}

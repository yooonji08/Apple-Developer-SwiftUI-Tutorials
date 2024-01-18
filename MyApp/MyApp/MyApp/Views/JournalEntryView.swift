//
//  JournalEntryView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct JournalEntryView: View {
    let journalEntry: JournalEntry
    
    private var title: String {
        journalEntry.createdDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year()
        )
    }
    
    var body: some View {
        ScrollView {
            Text(journalEntry.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationTitle(title)
    }
}

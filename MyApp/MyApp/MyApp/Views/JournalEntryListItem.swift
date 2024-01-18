//
//  JournalEntryListItem.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct JournalEntryListItem: View {
    let journalEntry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            DateView(date: journalEntry.createdDate)
            Text("\(journalEntry.text)")
                .lineLimit(2)
        }
    }
}

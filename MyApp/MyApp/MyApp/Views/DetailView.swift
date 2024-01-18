//
//  DetailView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var selectedEntry: JournalEntry?
    
    var body: some View {
        if let entry = selectedEntry {
            JournalEntryView(journalEntry: entry)
        }
        else {
            Text("Select a journal entry")
        }
    }
}

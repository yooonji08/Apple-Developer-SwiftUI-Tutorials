//
//  AlternativeContentView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct AlternativeContentView: View {
    @StateObject private var journal = Journal()
    @State private var selectedEntry: JournalEntry? = nil
    
    var body: some View {
        NavigationSplitView {
            List(journal.entries, selection: $selectedEntry) { entry in
                NavigationLink(value: entry) {
                    JournalEntryListItem(journalEntry: entry)
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200)
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            DetailView(selectedEntry: $selectedEntry)
        }
    }
}

#Preview {
    AlternativeContentView()
}

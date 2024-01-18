//
//  ContentView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

// ContentView: 가장 최상단 view
// View: 화면에 그려질 뷰
struct ContentView: View {
    @StateObject private var journal = Journal()
    
    // 다음과 같은 파일에서는(View를 사용하는 파일) body에 View 프로토콜을 사용
    var body: some View {
        NavigationStack {
            List(journal.entries) { entry in
                NavigationLink(value: entry) {
                    JournalEntryListItem(journalEntry: entry)
                }
            }
            .navigationDestination(for: JournalEntry.self) { entry in
                JournalEntryView(journalEntry: entry)
            }
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItem {
                    Button {
                        journal.addSampleEntry()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
        /*
        // Exploring the structure of a SwiftUI app 파트 튜토리얼
        // VStack:
        // -> 수직 정렬(Vertical Stack), 주로 하위 뷰 수가 적을 때 사용
        // -> 반대 개념(HStack: 수평 정렬)
        // Lazy VStack:
        // -> 하위 뷰가 많을 때 사용(뷰를 렌더링해서 사용)
        // -> 반대 개념(Lazy HStack)
        VStack {
            Image(systemName: "globe") // 이미지, 시스템에서 기본으로 제공하는 이미지 사용(sf symbols에서 원하는 이미지명 찾아서 입력하면 사용 가능)
                .imageScale(.large) // 뷰(VStack) 내의 이미지 크기를 상대적인 크기로 조정(small, medium, large)
                .foregroundStyle(.tint) // 이미지의 색상 지정 (foregroundColor는 descreted 예정이므로, 대신 foregroundStyle 사용)
            Text("Hello, world!") // 텍스트
        }
        .padding() // 안쪽 여백 추가
        //.padding([.bottom, .trailing], 20) // 여백을 주고 싶은 곳에 여백 지정 가능
         */
    }
}

#Preview {
    ContentView()
}

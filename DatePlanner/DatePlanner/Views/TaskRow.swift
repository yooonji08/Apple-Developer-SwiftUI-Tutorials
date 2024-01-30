//
//  TaskRow.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

// Task 화면에 들어갈 각 task 행 정보 화면
struct TaskRow: View {
    @Binding var task: EventTask
    var isEditing: Bool
    // FocusState: 키보드를 내리고/올릴 때 주로 사용
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)

            if isEditing || task.isNew {
                TextField("Task description", text: $task.text)
                    .focused($isFocused)
                    .onChange(of: isFocused) { newValue in
                        if newValue == false {
                            task.isNew = false
                        }
                    }

            } else {
                Text(task.text)
            }

            Spacer()
        }
        .padding(.vertical, 10)
        .task {
            if task.isNew {
                isFocused = true
            }
        }
    }
}

#Preview {
    TaskRow(task: .constant(EventTask(text: "Do something!")), isEditing: false)
}

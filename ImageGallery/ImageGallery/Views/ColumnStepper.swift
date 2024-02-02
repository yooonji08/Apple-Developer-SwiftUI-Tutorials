//
//  ColumnStepper.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI

// 그리드 보기 화면에서 column을 1~8까지 조절 가능한 -/+ 버튼
struct ColumnStepper: View {
    let title: String
    let range: ClosedRange<Int>
    @Binding var columns: [GridItem]
    @State private var numColumns: Int

    init(title: String, range: ClosedRange<Int>, columns: Binding<[GridItem]>) {
        self.title = title
        self.range = range
        self._columns = columns
        self.numColumns = columns.count
    }
    
    var body: some View {
        Stepper(title, value: $numColumns, in: range, step: 1) { _ in
            withAnimation { columns = Array(repeating: GridItem(.flexible()), count: numColumns) }
        }
    }
}

#Preview {
    ColumnStepper(title: "ColumnStepper", range: 1...8, columns: .constant(Array(repeating: GridItem(.flexible()), count: 5)))
}

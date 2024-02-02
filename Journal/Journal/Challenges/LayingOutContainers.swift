//
//  LayingOutContainers.swift
//  Journal
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI

struct LayingOutContainers: View {
    var body: some View {
        VStack {
            // ZStack안의 두 개의 뷰는 서로 겹쳐서 쌓아짐
            ZStack {
                // 도형 뷰는 화면 전체를 꽉 채워서 만들어짐
                Rectangle()
                    .foregroundStyle(.blue)
                Circle()
                    .foregroundStyle(.pink)
            }
            ZStack {
                Rectangle()
                    .foregroundStyle(.blue)
                HStack {
                    Circle()
                        .foregroundStyle(.red)
                    Circle()
                        .foregroundStyle(.orange)
                }
            }
        }
    }
}

#Preview {
    LayingOutContainers()
}

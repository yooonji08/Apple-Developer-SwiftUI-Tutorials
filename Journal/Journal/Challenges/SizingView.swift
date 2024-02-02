//
//  SizingView.swift
//  Journal
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI

struct SizingView: View {
    var body: some View {
        VStack {
            ZStack {
                // 화면 전체를 꽉 채움
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.brown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    Text("Roses are red,")
                    Image("Rose")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                        .foregroundStyle(.red)
                    Text("violets are blue,")
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.brown)
                    .frame(maxWidth: 200, maxHeight: 150)
                VStack {
                    VStack {
                        Text("I just love")
                        Image("Heart")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50)
                        Text("coding with you")                    }
                }
            }
        }
        .font(.headline)
        .foregroundStyle(.white) // 텍스트의 전체 색상을 흰색으로 설정
    }
}

#Preview {
    SizingView()
}
